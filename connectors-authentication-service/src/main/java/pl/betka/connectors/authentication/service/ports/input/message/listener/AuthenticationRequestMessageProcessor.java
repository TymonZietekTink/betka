package pl.betka.connectors.authentication.service.ports.input.message.listener;

import pl.betka.connectors.authentication.service.common.dto.AuthenticationRequest;

public interface AuthenticationRequestMessageProcessor {
  void authenticate(AuthenticationRequest authenticationRequest);
}
