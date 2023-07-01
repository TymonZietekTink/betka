package pl.betka.connectors_configuration.pl.betfan;

import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.AuthenticationData;

public class BetfanHttpAuthenticationData implements AuthenticationData {
  @Getter private String username;
  @Getter private String password;
  @Getter @Setter private String token;
}
