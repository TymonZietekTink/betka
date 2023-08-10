package pl.betka.connectors.authentication.service.ports.input.message.listener;

import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;

public interface AuthenticationRequestMessageProcessor {
  void processAuthenticationRequest(AuthenticationRequest authenticationRequest);
}
