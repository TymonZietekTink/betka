package pl.betka.connectors.authentication.service.domain;

import pl.betka.connectors.authentication.service.domain.event.AuthenticationEvent;

public interface AuthenticationDomainService {
  AuthenticationEvent validateAndInitializeAuthentication(Authentication authentication);
}
