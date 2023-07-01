package pl.betka.connectors_configuration.pl.etoto;

import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.AuthenticationData;

@Getter
@Setter
public class EtotoHttpAuthenticationData implements AuthenticationData {
  private String username;
  private String password;
  private String sessionId;

  
}
