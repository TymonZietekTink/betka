package pl.betka.connectors_configuration.pl.fortuna;

import java.net.HttpCookie;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.UserInfo;

@Getter
@Setter
@Builder
public class FortunaUserInfo implements UserInfo {
  private String username;
  private String password;
  private HttpCookie token;
}
