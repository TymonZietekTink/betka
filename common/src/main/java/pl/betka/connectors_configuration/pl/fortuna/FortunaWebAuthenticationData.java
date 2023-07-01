package pl.betka.connectors_configuration.pl.fortuna;

import java.net.HttpCookie;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.AuthenticationData;

@Getter
@Setter
public class FortunaWebAuthenticationData implements AuthenticationData {
  private String username;
  private String password;
  private HttpCookie token;
}
