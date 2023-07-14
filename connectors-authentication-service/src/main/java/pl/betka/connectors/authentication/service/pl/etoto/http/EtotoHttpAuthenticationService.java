package pl.betka.connectors.authentication.service.pl.etoto.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.stereotype.Component;
import pl.betka.connectors.authentication.service.common.domain.AuthenticationResponse;
import pl.betka.connectors.authentication.service.common.process.AuthenticatorService;
import pl.betka.connectors.authentication.service.pl.etoto.http.request.LoginRequest;
import pl.betka.connectors.common.http.StandardResponseHandler;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.connectors_configuration.pl.etoto.EtotoUserInfo;
import pl.betka.domain.AuthenticationStatus;

@Component
@RequiredArgsConstructor
public class EtotoHttpAuthenticationService implements AuthenticatorService {
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper = new ObjectMapper();
  private EtotoUserInfo authData;

  @Override
  @SneakyThrows
  public AuthenticationResponse authenticate(UserInfo authenticationData) {
    authData = (EtotoUserInfo) authenticationData;
    LoginRequest loginRequest = new LoginRequest(authData.getUsername(), authData.getPassword());
    String loginRequestAsString = objectMapper.writer().writeValueAsString(loginRequest);
    HttpPost httpPost = new HttpPost("https://api.etoto.pl/rest/customer/session/login");
    httpPost.setHeader("content-type", "application/json");
    httpPost.setHeader("accept", "application/json, text/plain, */*");
    httpPost.setEntity(new StringEntity(loginRequestAsString));
    var loginResponse = httpClient.execute(httpPost, new StandardResponseHandler());
    String sessionId = loginResponse.getHeader("x-odds-session").getValue();
    authData.setSessionId(sessionId);
    return AuthenticationResponse.builder()
        .authenticationStatus(AuthenticationStatus.AUTHENTICATED)
        .authData(authData)
        .build();
  }

  @Override
  public String getIdentifier() {
    return "pl-etoto-http";
  }
}
