package pl.betka.connectors.authentication.service.domain;

import lombok.RequiredArgsConstructor;
import pl.betka.connectors.authentication.service.domain.event.AuthenticationEvent;
import pl.betka.connectors.authentication.service.process.AuthenticatorService;
import pl.betka.connectors.authentication.service.connectors.ConnectorsRegistry;

@RequiredArgsConstructor
public class BasicAuthenticationDomainService implements AuthenticationDomainService {
  private final ConnectorsRegistry registry;

  @Override
  public AuthenticationEvent validateAndInitializeAuthentication(Authentication authentication) {
    AuthenticatorService service = registry.getAuthenticationService(authentication.getBookmakerIdentifier());
    AuthenticationResult authResult = service.authenticate(authentication.getUserInfo());
    return null;
  }
}