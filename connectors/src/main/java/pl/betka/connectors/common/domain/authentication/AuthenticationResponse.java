package pl.betka.connectors.common.domain.authentication;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.domain.AuthenticationStatus;

@Builder
@Getter
public class AuthenticationResponse {
  private AuthenticationData authData;
  private AuthenticationStatus authenticationStatus;
  private List<String> messages;
}
