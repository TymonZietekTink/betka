package pl.betka.connectors.authentication.service.pl.etoto.http.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class LoginRequest {
  @JsonProperty("login")
  private final String username;
  @JsonProperty("password")
  private final String password;

  @JsonProperty("channel")
  private final String channel = "desktop";

  @JsonProperty("browser")
  private final String browser = "chrome";

  @JsonProperty("device")
  private final String device = "desktop";
}
