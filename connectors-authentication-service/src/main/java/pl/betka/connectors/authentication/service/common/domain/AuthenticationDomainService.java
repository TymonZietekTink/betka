package pl.betka.connectors.authentication.service.common.domain;

import pl.betka.connectors.authentication.service.common.domain.event.AuthenticationEvent;

public interface AuthenticationDomainService {
  AuthenticationEvent validateAndInitializeAuthentication(Authentication authentication);
}
