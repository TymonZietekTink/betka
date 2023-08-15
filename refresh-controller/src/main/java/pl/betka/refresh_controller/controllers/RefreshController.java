package pl.betka.refresh_controller.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationResponse;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchRequest;
import pl.betka.connectors_configuration.pl.betclic.BetclicUserInfo;

@RestController
@RequiredArgsConstructor
public class RefreshController {
  private final ObjectMapper objectMapper;
  private final HttpClient httpClient;

  @SneakyThrows
  @PostMapping("/refresh")
  public void refresh(@RequestBody RefreshRequestBody refreshRequestBody){
      var requestBody = buildAuthenticationRequestBody(refreshRequestBody);
      httpClient.execute(buildRequest("http://localhost:8181/authenticate", requestBody), new BasicHttpClientResponseHandler());
  }

  @SneakyThrows
  @PostMapping("/authenticate_finished")
  public void refresh(@RequestBody AuthenticationResponse authenticationResponse){
    var requestBody = buildFetchingRequestBody(authenticationResponse);
    httpClient.execute(buildRequest("http://localhost:8182/fetch",requestBody), new BasicHttpClientResponseHandler());
  }

  @SneakyThrows
  private String buildFetchingRequestBody(AuthenticationResponse authenticationResponse) {
    BetclicUserInfo userInfo = objectMapper.readValue(authenticationResponse.getAuthenticationOutputData(), BetclicUserInfo.class);
    var body = FetchRequest.builder()
        .fetchingInputData(userInfo.getToken())
        .id(authenticationResponse.getId())
        .userId(authenticationResponse.getUserId())
        .connectorIdentifier(authenticationResponse.getConnectorIdentifier())
        .build();
    return objectMapper.writeValueAsString(body);
  }

  @SneakyThrows
  private ClassicHttpRequest buildRequest(String uri, String requestBody) {
    HttpPost httpPost = new HttpPost(uri);
    httpPost.setHeader("Content-Type", "application/json");
    httpPost.setHeader("User-Agent", BetclicConstants.USER_AGENT);
    httpPost.setHeader("Accept", "*/*");
    httpPost.setEntity(new StringEntity(requestBody));
    return httpPost;
  }

  @SneakyThrows
  private String buildAuthenticationRequestBody(RefreshRequestBody body) {
    AuthenticationRequest request = AuthenticationRequest.builder()
        .connectorIdentifier(body.getConnectorId())
        .id(body.getAuthId())
        .userId(body.getUserId())
        .authenticationInputData(body.getAuthData())
        .build();
    return objectMapper.writeValueAsString(request);
  }
}
