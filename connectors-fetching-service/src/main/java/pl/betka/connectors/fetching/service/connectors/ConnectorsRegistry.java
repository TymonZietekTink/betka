package pl.betka.connectors.fetching.service.connectors;

import static java.util.Optional.ofNullable;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import pl.betka.connectors.fetching.service.common.process.FetchTransactionService;

public class ConnectorsRegistry {
  private final Map<String, FetchTransactionService> connectorsRegistry;

  public ConnectorsRegistry(Collection<FetchTransactionService> fetchingService) {
    this.connectorsRegistry =
        ofNullable(fetchingService).orElseGet(List::of).stream()
            .collect(
                Collectors.toUnmodifiableMap(
                    FetchTransactionService::getConnectorIdentifier, it -> it));
  }

  public FetchTransactionService getFetchingService(String connectorIdentifier) {
    return Optional.of(connectorsRegistry.get(connectorIdentifier))
        .orElseThrow(() -> new IllegalStateException("Missing connector"));
  }
}
