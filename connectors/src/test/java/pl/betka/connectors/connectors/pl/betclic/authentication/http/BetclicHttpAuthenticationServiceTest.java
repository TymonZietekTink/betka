package pl.betka.connectors.connectors.pl.betclic.authentication.http;

import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.equalTo;
import static com.github.tomakehurst.wiremock.client.WireMock.post;
import static com.github.tomakehurst.wiremock.client.WireMock.stubFor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.tomakehurst.wiremock.junit5.WireMockRuntimeInfo;
import com.github.tomakehurst.wiremock.junit5.WireMockTest;
import org.apache.hc.client5.http.classic.HttpClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import pl.betka.connectors.connectors.pl.betclic.HttpAuthenticationConfig;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;

@SpringBootTest(classes = {HttpAuthenticationConfig.class})
@WireMockTest(httpPort = 53154)
public class BetclicHttpAuthenticationServiceTest {
  private static final String USERNAME = "dummy_username";
  private static final String PASSWORD = "dummy_password";

  @Autowired
  @Qualifier("integrationTestObjectMapper")
  ObjectMapper objectMapper;

  @Autowired
  @Qualifier("integrationTestHttpClient")
  HttpClient httpClient;

  @Autowired
  @Qualifier("wiremockHost")
  String host;

  @Test
  public void happy_path_register_device(WireMockRuntimeInfo wireMockRuntimeInfo) {
    // given
    BetclicHttpAuthenticationService service = new BetclicHttpAuthenticationService(httpClient, objectMapper,host);
    BetclicHttpAuthenticationData data =
        BetclicHttpAuthenticationData.builder().username(USERNAME).password(PASSWORD).build();
    createHappyPathRegisterDevice();

    // when
    service.authenticate(data);

    // then

  }

  private void createHappyPathRegisterDevice() {
    stubFor(
        post("/api/v1/account/auth/logins")
            .willReturn(aResponse().withStatus(200)));
  }
}
