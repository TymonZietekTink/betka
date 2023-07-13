package pl.betka.connectors.fetching.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import pl.betka.connectors.common.configuration.ConnectorsConfiguration;

@SpringBootApplication
@Import(ConnectorsConfiguration.class)
public class ConnectorsFetchingApplicationService {
  public static void main(String[] args) {
    SpringApplication.run(ConnectorsFetchingApplicationService.class, args);
  }
}
