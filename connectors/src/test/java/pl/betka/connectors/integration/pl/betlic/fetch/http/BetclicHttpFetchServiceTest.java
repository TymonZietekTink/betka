package pl.betka.connectors.integration.pl.betlic.fetch.http;

import static com.github.tomakehurst.wiremock.client.WireMock.get;
import static com.github.tomakehurst.wiremock.client.WireMock.post;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.core.WireMockConfiguration;
import com.github.tomakehurst.wiremock.junit5.WireMockTest;
import org.apache.hc.client5.http.classic.HttpClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import pl.betka.connectors.integration.HttpAuthenticationConfig;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.BetclicHttpFetchService;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;

@SpringBootTest(classes = {HttpAuthenticationConfig.class})
@WireMockTest
public class BetclicHttpFetchServiceTest {
  private static final String USERNAME = "dummy_username";
  private static final String PASSWORD = "dummy_password";

  @Autowired
  ObjectMapper objectMapper;

  @Autowired
  HttpClient httpClient;

  private static WireMockServer wireMockServer;

  static {
    WireMockConfiguration configuration = WireMockConfiguration.wireMockConfig()
        .keystorePath("./src/test/resources/keystore/wiremock.jks")
        .keystorePassword("password")
        .keyManagerPassword("password")
        .httpDisabled(true)
        .httpsPort(8443)
        .enableBrowserProxying(true);
    wireMockServer = new WireMockServer(configuration);
  }

  @Test
  public void happy_path_register_device() {
    // given
//    wireMockServer.stubFor(WireMock.get(UrlPattern.ANY).withHost(new EqualToPattern());
    BetclicHttpFetchService service = new BetclicHttpFetchService(httpClient, objectMapper);
    BetclicHttpAuthenticationData data =
        BetclicHttpAuthenticationData.builder().username(USERNAME).password(PASSWORD).build();

    // when
    service.fetchTransactions(data);

    // then

  }
}
