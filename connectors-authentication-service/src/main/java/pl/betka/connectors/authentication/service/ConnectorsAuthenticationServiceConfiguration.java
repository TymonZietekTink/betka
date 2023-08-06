package pl.betka.connectors.authentication.service;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import pl.betka.connectors.authentication.service.common.process.AuthenticatorService;
import pl.betka.connectors.authentication.service.connectors.ConnectorsRegistry;

@Configuration
public class ConnectorsAuthenticationServiceConfiguration {

  @Bean
  ConnectorsRegistry connectorsRegistry(ListableBeanFactory beanFactory) {
    var clients = beanFactory.getBeansOfType(AuthenticatorService.class).values();
    return new ConnectorsRegistry(clients);
  }
}
