package pl.betka.connectors_configuration.pl.betfan;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.UserInfo;

@Getter
@Setter
@Builder
public class BetfanUserInfo implements UserInfo {
  private String username;
  private String password;
  private String token;
}
