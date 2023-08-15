package pl.betka.connectors.authentication.service.process;

import pl.betka.connectors.authentication.service.domain.AuthenticationResult;
import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.UserInfo;

public interface AuthenticatorService extends ConnectorIdentifier {
  AuthenticationResult authenticate(UserInfo userInfo);
}
