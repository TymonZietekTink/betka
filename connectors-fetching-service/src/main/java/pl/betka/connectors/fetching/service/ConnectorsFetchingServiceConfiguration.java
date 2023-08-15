package pl.betka.connectors.fetching.service;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.context.annotation.Bean;
import pl.betka.connectors.fetching.service.common.process.FetchTransactionService;
import pl.betka.connectors.fetching.service.connectors.ConnectorsRegistry;

public class ConnectorsFetchingServiceConfiguration {
  @Bean
  ConnectorsRegistry connectorsRegistry(ListableBeanFactory beanFactory) {
    var clients = beanFactory.getBeansOfType(FetchTransactionService.class).values();
    return new ConnectorsRegistry(clients);
  }
}
