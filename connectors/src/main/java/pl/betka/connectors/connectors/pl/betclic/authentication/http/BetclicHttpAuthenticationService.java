package pl.betka.connectors.connectors.pl.betclic.authentication.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.stereotype.Component;
import pl.betka.connectors.common.domain.authentication.AuthenticationResponse;
import pl.betka.connectors.common.exceptions.AuthenticationException;
import pl.betka.connectors.common.process.authentication.AuthenticatorService;
import pl.betka.connectors.common.utils.RandomValuesProvider;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.entity.Digest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.BirtDateDigestRequest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.BirtDateDigestRequest.Parameter;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.request.LoginRequest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.response.LoginResponse;
import pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.connectors_configuration.pl.betclic.BetclicUserInfo;
import pl.betka.domain.AuthenticationStatus;

@Component
@RequiredArgsConstructor
public class BetclicHttpAuthenticationService implements AuthenticatorService {
  private static final String HOST = "https://apif.begmedia.com/";

  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;
  private final RandomValuesProvider randomValuesProvider;
  private BetclicUserInfo authData;

  @Override
  public String getIdentifier() {
    return BetclicConstants.HTTP_IDENTIFIER;
  }

  @SneakyThrows
  @Override
  public AuthenticationResponse authenticate(UserInfo authenticationData) {
    authData = (BetclicUserInfo) authenticationData;
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
    var loginRequest = buildRequest(loginRequestBody, HOST + "api/v1/account/auth/logins");
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
    var path = HOST + loginResponse.getLoginRequestId() + "/digests";
    var request = buildRequest(requestBody, path);
    var response = httpClient.execute(request, new BasicHttpClientResponseHandler());
    return objectMapper.readValue(response, LoginResponse.class);
  }

  @SneakyThrows
  private static ClassicHttpRequest buildRequest(String body, String uri) {
    HttpPost httpPost = new HttpPost(uri);
    httpPost.setHeader("Content-Type", "application/json");
    httpPost.setHeader("User-Agent", BetclicConstants.USER_AGENT);
    httpPost.setHeader("Accept", "*/*");
    httpPost.setEntity(new StringEntity(body));
    return httpPost;
  }
}
