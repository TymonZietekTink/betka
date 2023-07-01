package pl.betka.connectors.connectors.pl.betclic.authentication.http.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Token {
  private String auth;
  private String context;
  private int expires;
}
