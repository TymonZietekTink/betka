package pl.betka.connectors_configuration.pl.betclic;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.AuthenticationData;

@Getter
@Setter
@Builder
public class BetclicHttpAuthenticationData implements AuthenticationData {
  private String fingerprint;
  private String token;
  private String username;
  private String password;
  private String dateOfBirth;
}