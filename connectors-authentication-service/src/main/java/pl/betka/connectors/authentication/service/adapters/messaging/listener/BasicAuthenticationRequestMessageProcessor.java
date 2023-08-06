package pl.betka.connectors.authentication.service.adapters.messaging.listener;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import pl.betka.connectors.authentication.service.common.domain.event.AuthenticationCompletedEvent;
import pl.betka.connectors.authentication.service.common.domain.event.AuthenticationEvent;
import pl.betka.connectors.authentication.service.common.dto.AuthenticationRequest;
import pl.betka.connectors.authentication.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.authentication.service.ports.input.message.listener.AuthenticationRequestMessageProcessor;

@RequiredArgsConstructor
@Slf4j
public class BasicAuthenticationRequestMessageProcessor implements
    AuthenticationRequestMessageProcessor {
  private final ConnectorsRegistry connectorsRegistry;

  @Override
  public void authenticate(AuthenticationRequest authenticationRequest) {
      var connectoridentifier = authenticationRequest.getConnectorIdentifier();
      var connector = connectorsRegistry.getAuthenticationService(connectoridentifier);
      var authResponse = connector.authenticate(null);
      fireEvent(new AuthenticationCompletedEvent(authResponse));
  }

  private void fireEvent(AuthenticationEvent authenticationEvent) {
    log.info("Publishing authentication event with authentication id");
    authenticationEvent.fire();
  }
}
