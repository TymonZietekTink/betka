package pl.betka.connectors.common.process.authentication;

import pl.betka.connectors.common.domain.authentication.AuthenticationResponse;
import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.AuthenticationData;

public interface AuthenticatorService extends ConnectorIdentifier {
  AuthenticationResponse authenticate(AuthenticationData authenticationData);
}
