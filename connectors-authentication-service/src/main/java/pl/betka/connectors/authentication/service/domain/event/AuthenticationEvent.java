package pl.betka.connectors.authentication.service.domain.event;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors.authentication.service.domain.model.Authentication;
import pl.betka.domain.event.DomainEvent;

@RequiredArgsConstructor
@Getter
public abstract class AuthenticationEvent implements DomainEvent<Authentication> {
  private final Authentication authentication;
}

