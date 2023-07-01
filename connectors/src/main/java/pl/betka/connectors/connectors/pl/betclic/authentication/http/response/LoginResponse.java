package pl.betka.connectors.connectors.pl.betclic.authentication.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.Getter;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.entity.Digest;
import pl.betka.connectors.connectors.pl.betclic.authentication.http.entity.Token;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class LoginResponse {
  @JsonProperty("id")
  private String loginRequestId;

  @JsonProperty("status")
  private String loginStatus;

  private List<Digest> digests;

  private Token token;

  @JsonProperty("access_token")
  private String accessToken;
}
