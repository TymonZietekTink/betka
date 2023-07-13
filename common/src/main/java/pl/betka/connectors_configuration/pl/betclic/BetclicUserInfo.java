package pl.betka.connectors_configuration.pl.betclic;

import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.UserInfo;

@Getter
@Setter
@Builder
@EqualsAndHashCode
public class BetclicUserInfo implements UserInfo {
  private String fingerprint;
  private String token;
  private String username;
  private String password;
  private String dateOfBirth;
}
