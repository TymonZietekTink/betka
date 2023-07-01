package pl.betka.connectors.connectors.pl.betclic.authentication.http.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;

@Getter
@Builder
public class LoginRequest {
  @JsonProperty("login")
  private String username;
  private String password;
  private String fingerprint;

  @JsonProperty("client_info")
  private ClientInfo clientInfo;

  @Getter
  @Builder
  private static class ClientInfo {
    private String application;
    private String universe;
    private String channel;
  }

  public static LoginRequest buildDefaultLoginRequest(BetclicHttpAuthenticationData data) {
    return LoginRequest.builder()
        .fingerprint(data.getFingerprint())
        .username(data.getUsername())
        .password(data.getPassword())
        .clientInfo(
            ClientInfo.builder()
                .application("BETCLIC.PL")
                .channel("WEB_BETCLIC.PL")
                .universe("sport")
                .build())
        .build();
  }
  ;
}