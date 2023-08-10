package pl.betka.connectors.authentication.service.integration.connectors.configuration;

import com.github.tomakehurst.wiremock.http.HttpClientFactory;
import org.apache.hc.client5.http.classic.HttpClient;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import pl.betka.connectors.authentication.service.integration.utils.FakeRandomValuesProvider;
import pl.betka.connectors.common.utils.RandomValuesProvider;

@TestConfiguration
public class TestConnectorConfiguration {
  @Bean
  @Profile("integration")
  public HttpClient integrationTestHttpClient() {
    return HttpClientFactory.createClient();
  }

  @Bean
  @Profile("integration")
  public RandomValuesProvider fakeRandomValuesProvider() {
    return new FakeRandomValuesProvider();
  }
}
