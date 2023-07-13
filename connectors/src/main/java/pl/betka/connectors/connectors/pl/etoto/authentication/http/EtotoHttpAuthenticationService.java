package pl.betka.connectors.connectors.pl.etoto.authentication.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import pl.betka.connectors.ConnectorsConfiguration;
import pl.betka.connectors.common.http.StandardResponseHandler;
import pl.betka.connectors.common.process.authentication.AuthenticatorService;
import pl.betka.connectors.connectors.pl.etoto.authentication.http.request.LoginRequest;
import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.connectors_configuration.pl.etoto.EtotoHttpAuthenticationData;
import pl.betka.connectors.common.domain.authentication.AuthenticationResponse;
import pl.betka.domain.AuthenticationStatus;

@Component
@RequiredArgsConstructor
@Import(ConnectorsConfiguration.class)
public class EtotoHttpAuthenticationService implements AuthenticatorService {
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper = new ObjectMapper();
  private EtotoHttpAuthenticationData authData;


  @Override
  @SneakyThrows
  public AuthenticationResponse authenticate(
      AuthenticationData authenticationData) {
    authData = (EtotoHttpAuthenticationData) authenticationData;
    LoginRequest loginRequest = new LoginRequest(authData.getUsername(), authData.getPassword());
    String loginRequestAsString = objectMapper.writer().writeValueAsString(loginRequest);
    HttpPost httpPost = new HttpPost("https://api.etoto.pl/rest/customer/session/login");
    httpPost.setHeader("content-type", "application/json");
    httpPost.setHeader("accept", "application/json, text/plain, */*");
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
