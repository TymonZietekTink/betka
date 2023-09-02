package pl.betka.connectors.authentication.service.domain;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.domain.AuthenticationStatus;

@Builder
@Getter
public class AuthenticationResult {
  private UserInfo authData;
  private AuthenticationStatus authenticationStatus;
  private List<String> messages;
}