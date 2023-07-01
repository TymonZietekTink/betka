package pl.betka.connectors.connectors.pl.betclic.fetch.http;

import static org.junit.jupiter.api.Assertions.*;

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
public class BetclicHttpFetchServiceTest {
  private static final String USERNAME = "dummy_username";
  private static final String PASSWORD = "dummy_password";

  @Autowired
  @Qualifier("integrationTestObjectMapper")
  ObjectMapper objectMapper;

  @Autowired
  @Qualifier("integrationTestHttpClient")
  HttpClient httpClient;

  @Test
  public void happy_path_register_device(WireMockRuntimeInfo wireMockRuntimeInfo) {
    // given
    BetclicHttpFetchService service = new BetclicHttpFetchService(httpClient, objectMapper);
    BetclicHttpAuthenticationData data =
        BetclicHttpAuthenticationData.builder().username(USERNAME).password(PASSWORD).build();

    // when
    service.fetchTransactions(data);

    // then

  }
}
