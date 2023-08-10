package pl.betka.connectors.authentication.service.domain.process;

import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.UserInfo;

public interface AuthenticatorService extends ConnectorIdentifier {
  AuthenticationResponse authenticate(UserInfo userInfo);
}
