package pl.betka.connectors.authentication.service.process;

import pl.betka.connectors.authentication.service.domain.AuthenticationResponse;
import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.UserInfo;

public interface AuthenticatorService extends ConnectorIdentifier {
  AuthenticationResponse authenticate(UserInfo userInfo);
}
