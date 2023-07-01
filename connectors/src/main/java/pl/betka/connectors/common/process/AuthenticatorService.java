package pl.betka.connectors.common.process;

import pl.betka.domain.AuthenticationResponse;
import pl.betka.connectors_configuration.AuthenticationData;

public interface AuthenticatorService extends ConnectorIdentifier{
  AuthenticationResponse authenticate(AuthenticationData authenticationData);
}
