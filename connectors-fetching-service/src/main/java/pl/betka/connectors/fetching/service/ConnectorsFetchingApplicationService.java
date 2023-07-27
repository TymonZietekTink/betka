package pl.betka.connectors.fetching.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import pl.betka.connectors.common.configuration.ConnectorsConfiguration;

@SpringBootApplication
@EntityScan(basePackages = { "pl.betka.connectors.fetching.service.dataaccess" })
@EnableJpaRepositories(basePackages = { "pl.betka.connectors.fetching.service.dataaccess" })
@Import(ConnectorsConfiguration.class)
public class ConnectorsFetchingApplicationService {
  public static void main(String[] args) {
    SpringApplication.run(ConnectorsFetchingApplicationService.class, args);
  }
}
