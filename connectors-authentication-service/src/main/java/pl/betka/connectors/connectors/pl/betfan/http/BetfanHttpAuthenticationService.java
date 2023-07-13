package pl.betka.connectors.connectors.pl.betfan.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.ClassicHttpResponse;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import pl.betka.connectors.common.configuration.ConnectorsConfiguration;
import pl.betka.connectors.common.domain.AuthenticationResponse;
import pl.betka.connectors.common.exceptions.AuthenticationException;
import pl.betka.connectors.common.http.StandardResponseHandler;
import pl.betka.connectors.common.process.authentication.AuthenticatorService;
import pl.betka.connectors.connectors.pl.betfan.http.request.LoginRequest;
import pl.betka.connectors.connectors.pl.betfan.http.response.LoginResponse;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.connectors_configuration.pl.betfan.BetfanUserInfo;
import pl.betka.domain.AuthenticationStatus;

@Component
@RequiredArgsConstructor
@Import(ConnectorsConfiguration.class)
public class BetfanHttpAuthenticationService implements AuthenticatorService {
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;
  private BetfanUserInfo authData;
  private static final String SESSION_ID_HEADER = "x-odds-session";

  @Override
  @SneakyThrows
  public AuthenticationResponse authenticate(UserInfo userInfo) {
    authData = (BetfanUserInfo) userInfo;
    var loginResponse = login();
    var sessionIdHeader = loginResponse.getHeader(SESSION_ID_HEADER);
    if (sessionIdHeader == null) {
      throw new AuthenticationException("No session Id token");
    }
    authData.setToken(sessionIdHeader.getValue());
    return AuthenticationResponse.builder()
        .authenticationStatus(AuthenticationStatus.AUTHENTICATED)
        .authData(authData)
        .build();
  }

  @SneakyThrows
  private ClassicHttpResponse login() {
    LoginRequest loginCredentials =
        new LoginRequest(authData.getUsername(), authData.getPassword());
    var loginRequestBody = objectMapper.writer().writeValueAsString(loginCredentials);
    var loginRequest =
        buildRequest(loginRequestBody, "https://api-v2.betfan.pl/api/v1/customer/session/login");
    var loginResponse = httpClient.execute(loginRequest, new StandardResponseHandler());
    var loginResponseBody =
        objectMapper.readValue(
            EntityUtils.toString(loginResponse.getEntity()), LoginResponse.class);
    if (loginResponseBody.isError() || loginResponseBody.getCode() != 200) {
      throw new AuthenticationException("Login is not validated");
    }
    return loginResponse;
  }

  @SneakyThrows
  private static ClassicHttpRequest buildRequest(String body, String uri) {
    HttpPost httpPost = new HttpPost(new URI(uri));
    httpPost.setHeader("Content-Type", "application/json");
    httpPost.setHeader(
        "User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36");
    httpPost.setHeader("Accept", "*/*");
    httpPost.setHeader("refer", "https://www.betfan.pl/");
    httpPost.setEntity(new StringEntity(body));
    return httpPost;
  }

  @Override
  public String getIdentifier() {
    return "pl-betfan-http";
  }
}
