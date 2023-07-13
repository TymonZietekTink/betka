package pl.betka.connectors.authentication.service.pl.betfan.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
public class LoginResponse {
  private boolean isError;
  private int code;
}
