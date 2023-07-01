package pl.betka.domain;

import java.util.List;
import lombok.Builder;
import pl.betka.connectors_configuration.AuthenticationData;

@Builder
public class AuthenticationResponse {
  private AuthenticationData authData;
  private AuthenticationStatus authenticationStatus;
  private List<String> messages;
}
