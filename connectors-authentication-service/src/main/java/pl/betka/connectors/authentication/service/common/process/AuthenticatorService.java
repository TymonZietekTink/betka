package pl.betka.connectors.authentication.service.common.process;

import pl.betka.connectors.authentication.service.common.domain.AuthenticationResponse;
import pl.betka.connectors.authentication.service.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.UserInfo;

public interface AuthenticatorService extends ConnectorIdentifier {
  AuthenticationResponse authenticate(UserInfo userInfo);
}
