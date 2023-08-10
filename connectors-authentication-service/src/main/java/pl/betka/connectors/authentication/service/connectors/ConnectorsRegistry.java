package pl.betka.connectors.authentication.service.connectors;

import static java.util.Optional.ofNullable;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import pl.betka.connectors.authentication.service.domain.process.AuthenticatorService;

public class ConnectorsRegistry {
  private final Map<String, AuthenticatorService> connectorsRegistry;

  public ConnectorsRegistry(Collection<AuthenticatorService> authenticatorServices) {
    this.connectorsRegistry =
        ofNullable(authenticatorServices).orElseGet(List::of).stream()
            .collect(
                Collectors.toUnmodifiableMap(
                    AuthenticatorService::getConnectorIdentifier, it -> it));
  }

  public AuthenticatorService getAuthenticationService(String connectorIdentifier) {
    return Optional.of(connectorsRegistry.get(connectorIdentifier))
        .orElseThrow(() -> new IllegalStateException("Missing connector"));
  }
}
