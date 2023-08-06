package pl.betka.connectors.authentication.service.common.domain.event;

import lombok.RequiredArgsConstructor;
import pl.betka.connectors.authentication.service.common.domain.AuthenticationResponse;

@RequiredArgsConstructor
public class AuthenticationCompletedEvent extends AuthenticationEvent{
  private final AuthenticationResponse response;

  @Override
  public void fire() {

  }
}
