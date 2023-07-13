package pl.betka.connectors.fetching.service.common.domain.authentication;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.domain.AuthenticationStatus;

@Builder
@Getter
public class AuthenticationResponse {
  private UserInfo authData;
  private AuthenticationStatus authenticationStatus;
  private List<String> messages;
}
