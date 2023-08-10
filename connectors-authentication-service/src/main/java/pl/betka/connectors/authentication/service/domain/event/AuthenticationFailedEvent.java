package pl.betka.connectors.authentication.service.domain.event;

import pl.betka.connectors.authentication.service.domain.model.Authentication;

public class AuthenticationFailedEvent extends AuthenticationEvent {

  public AuthenticationFailedEvent(Authentication authentication) {
    super(authentication);
  }

  @Override
  public void fire() {

  }
}
