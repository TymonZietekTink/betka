package pl.betka.connectors.authentication.service.adapters.messaging.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "authentication-service")
public class AuthenticationMessagingConfig {
  private String authenticationRequestTopicName;
  private String authenticationResponseTopicName;
}
