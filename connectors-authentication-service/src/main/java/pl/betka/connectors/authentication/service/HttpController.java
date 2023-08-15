package pl.betka.connectors.authentication.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.betka.connectors.authentication.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.authentication.service.domain.AuthenticationResult;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationResponse;
import pl.betka.connectors.authentication.service.exceptions.AuthenticationException;
import pl.betka.connectors.authentication.service.process.AuthenticatorService;
import pl.betka.connectors_configuration.pl.betclic.BetclicUserInfo;
import pl.betka.domain.AuthenticationStatus;

@RestController
@RequiredArgsConstructor
public class HttpController {
  private final ConnectorsRegistry connectorsRegistry;
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;

  @SneakyThrows
  @PostMapping(path = "/authenticate", consumes = MediaType.APPLICATION_JSON_VALUE)
  public void authenticate(@RequestBody AuthenticationRequest authenticationRequest) {
    AuthenticatorService service =
        connectorsRegistry.getAuthenticationService(authenticationRequest.getConnectorIdentifier());
    BetclicUserInfo betclicUserInfo = objectMapper.readValue(authenticationRequest.getAuthenticationInputData(), BetclicUserInfo.class);
    AuthenticationResult authenticationResult = service.authenticate(betclicUserInfo);
    if(!authenticationResult.getAuthenticationStatus().equals(AuthenticationStatus.AUTHENTICATED)){
      throw new AuthenticationException("Failed to authenticate");
    }
    var request = buildRequest(buildBody(authenticationResult, authenticationRequest));
    httpClient.execute(request, new BasicHttpClientResponseHandler());
  }

  @SneakyThrows
  private String buildBody(AuthenticationResult result, AuthenticationRequest request) {
    var response =
        AuthenticationResponse.builder()
            .authenticationStatus(result.getAuthenticationStatus())
            .authenticationOutputData(objectMapper.writeValueAsString(result.getAuthData()))
            .userId(request.getUserId())
            .connectorIdentifier(request.getConnectorIdentifier())
            .id(request.getId())
            .build();
    return objectMapper.writeValueAsString(response);
  }

  @SneakyThrows
  private static ClassicHttpRequest buildRequest(String body) {
    HttpPost httpPost = new HttpPost("http://localhost:8183/authenticate_finished");
    httpPost.setHeader("Content-Type", "application/json");
    httpPost.setHeader("User-Agent", BetclicConstants.USER_AGENT);
    httpPost.setHeader("Accept", "*/*");
    httpPost.setEntity(new StringEntity(body));
    return httpPost;
  }
}
