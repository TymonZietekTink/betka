package pl.betka.connectors.connectors.pl.betfan.authentication.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class LoginResponse {
  private boolean isError;
  private int code;
}
