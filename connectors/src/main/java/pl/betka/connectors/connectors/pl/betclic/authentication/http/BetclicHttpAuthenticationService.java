package pl.betka.connectors.connectors.pl.betclic.authentication.http;

import static pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants.HOST_PATH;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import pl.betka.connectors.ConnectorsConfiguration;
import pl.betka.connectors.common.exceptions.AuthenticationException;
import pl.betka.connectors.common.process.AuthenticatorService;
import pl.betka.connectors.common.utils.RandomValuesProvider;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.entity.Digest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.BirtDateDigestRequest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.BirtDateDigestRequest.Parameter;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.LoginRequest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.response.LoginResponse;
import pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;
import pl.betka.domain.AuthenticationResponse;
import pl.betka.domain.AuthenticationStatus;

@Import(ConnectorsConfiguration.class)
@Component
@RequiredArgsConstructor
public class BetclicHttpAuthenticationService implements AuthenticatorService {
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;
  private final RandomValuesProvider randomValuesProvider;
  private BetclicHttpAuthenticationData authData;

  @Override
  public String getIdentifier() {
    return BetclicConstants.HTTP_IDENTIFIER;
  }

  @SneakyThrows
  @Override
  public AuthenticationResponse authenticate(AuthenticationData authenticationData) {
    authData = (BetclicHttpAuthenticationData) authenticationData;
    if (authData.getFingerprint() == null) {
      authData.setFingerprint(randomValuesProvider.generateUUID().toString());
    }

    var loginResponse = login();
    if (loginResponse.getLoginStatus().equals("DigestsToValidate")) {
      loginResponse = loginWithDigest(loginResponse);
    }
    if (!"Validated".equals(loginResponse.getLoginStatus())) {
      throw new AuthenticationException("Login is not validated");
    }
    authData.setToken(objectMapper.writer().writeValueAsString(loginResponse.getToken()));
    return AuthenticationResponse.builder()
        .authenticationStatus(AuthenticationStatus.AUTHENTICATED)
        .authData(authData)
        .build();
  }

  @SneakyThrows
  private LoginResponse login() {
    LoginRequest loginCredentials = LoginRequest.buildDefaultLoginRequest(authData);
    var loginRequestBody = objectMapper.writer().writeValueAsString(loginCredentials);
    var loginRequest = buildRequest(loginRequestBody, "https://apif.begmedia.com/api/v1/account/auth/logins");
    var loginResponse = httpClient.execute(loginRequest, new BasicHttpClientResponseHandler());
    return objectMapper.readValue(loginResponse, LoginResponse.class);
  }

  @SneakyThrows
  private LoginResponse loginWithDigest(LoginResponse loginResponse) {
    if (loginResponse.getDigests().size() != 1) {
      throw new AuthenticationException("More than 1 digests");
    }
    Digest digest = loginResponse.getDigests().get(0);
    BirtDateDigestRequest birtDateDigestRequest =
        BirtDateDigestRequest.builder()
            .digestId(digest.getDigestId())
            .parameters(new Parameter(authData.getDateOfBirth()))
            .build();
    var requestBody = objectMapper.writer().writeValueAsString(List.of(birtDateDigestRequest));
    var path = HOST_PATH + loginResponse.getLoginRequestId() + "/digests";
    var request = buildRequest(requestBody, path);
    var response = httpClient.execute(request, new BasicHttpClientResponseHandler());
    return objectMapper.readValue(response, LoginResponse.class);
  }

  @SneakyThrows
  private static ClassicHttpRequest buildRequest(String body, String uri) {
    HttpPost httpPost = new HttpPost(uri);
    httpPost.setHeader("Content-Type", "application/json");
    httpPost.setHeader(           "User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36");
    httpPost.setHeader("Accept", "*/*");
    httpPost.setEntity(new StringEntity(body));
    return httpPost;
  }
}
