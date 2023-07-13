package pl.betka.connectors_configuration.pl.etoto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import pl.betka.connectors_configuration.UserInfo;

@Getter
@Setter
@Builder
public class EtotoUserInfo implements UserInfo {
  private String username;
  private String password;
  private String sessionId;
}
