package pl.betka.connectors.authentication.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import pl.betka.connectors.common.configuration.ConnectorsConfiguration;
import pl.betka.infrastructure.kafka.producer.KafkaProducerConfig;

@SpringBootApplication
@Import({ConnectorsConfiguration.class, KafkaProducerConfig.class})
public class ConnectorsAuthenticationApplicationService {
  public static void main(String[] args) {
    SpringApplication.run(ConnectorsAuthenticationApplicationService.class, args);
  }
}
