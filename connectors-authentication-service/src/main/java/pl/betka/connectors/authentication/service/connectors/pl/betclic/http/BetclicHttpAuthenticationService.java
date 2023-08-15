package pl.betka.connectors.authentication.service.connectors.pl.betclic.http;

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
import pl.betka.connectors.authentication.service.domain.AuthenticationResult;
import pl.betka.connectors.authentication.service.exceptions.AuthenticationException;
import pl.betka.connectors.authentication.service.process.AuthenticatorService;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.common.utils.RandomValuesProvider;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.entity.Digest;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.request.BirtDateDigestRequest;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.request.BirtDateDigestRequest.Parameter;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.request.LoginRequest;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.response.LoginResponse;
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
  public String getConnectorIdentifier() {
    return BetclicConstants.CONNECTOR_IDENTIFIER;
  }

  @SneakyThrows
  @Override
  public AuthenticationResult authenticate(UserInfo authenticationData) {
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
    return AuthenticationResult.builder()
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
    httpPost.setHeader(
        "X-Client",
        "\n"
            + "{\"auth\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcdTAwMjJJcFx1MDAyMjpcdTAwMjI4OS42NC44OS4yMDNcdTAwMjIsXHUwMDIyU2Vzc2lvblx1MDAyMjpudWxsLFx1MDAyMlVzZXJJZFx1MDAyMjowLFx1MDAyMkNvdW50cnlDb2RlXHUwMDIyOm51bGwsXHUwMDIyTGFuZ3VhZ2VDb2RlXHUwMDIyOlx1MDAyMnBhXHUwMDIyLFx1MDAyMkN1cnJlbmN5Q29kZVx1MDAyMjpudWxsLFx1MDAyMklzQWRtaW5cdTAwMjI6ZmFsc2UsXHUwMDIySXNMb2dnZWRGcm9tQm9cdTAwMjI6ZmFsc2UsXHUwMDIySXNMYXVuY2hlclx1MDAyMjpmYWxzZSxcdTAwMjJSZWd1bGF0b3JJZFx1MDAyMjo3LFx1MDAyMk5vdEJlZm9yZVx1MDAyMjpcdTAwMjIyMDIzLTA4LTEzVDE3OjE1OjE3LjIyNDk2OTJaXHUwMDIyLFx1MDAyMkV4cGlyYXRpb25UaW1lXHUwMDIyOlx1MDAyMjIwMjMtMDgtMTNUMTk6MTc6MTcuMjI1MDAyNFpcdTAwMjJ9Ig.2OyHrXoWEN9CNaKqKb7RQcDCselhCNtBF5miHYZTzpo\",\"context\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcdTAwMjJMZWdpc2xhdGlvblx1MDAyMjpcdTAwMjJQbFx1MDAyMixcdTAwMjJTaXRlXHUwMDIyOlx1MDAyMlBMUEFcdTAwMjIsXHUwMDIyTGFuZ3VhZ2VcdTAwMjI6XHUwMDIycGFcdTAwMjIsXHUwMDIyQ2hhbm5lbElkXHUwMDIyOlx1MDAyMkJldGNsaWNQbFx1MDAyMixcdTAwMjJVbml2ZXJzZVx1MDAyMjpcdTAwMjJzcG9ydHNcdTAwMjIsXHUwMDIyTm90QmVmb3JlXHUwMDIyOlx1MDAyMjIwMjMtMDgtMTNUMTc6MTU6MTcuMjI0OTY5MlpcdTAwMjIsXHUwMDIyRXhwaXJhdGlvblRpbWVcdTAwMjI6XHUwMDIyMjAyMy0wOC0xM1QxOToxNzoxNy4yMjUwOTUyWlx1MDAyMn0i.66pNEjspwRRZdmNfsSe2JNHSt9LbbWWBaBqdEasubvI\",\"expiresIn\":7200016}");
    httpPost.setEntity(new StringEntity(body));
    return httpPost;
  }
}
