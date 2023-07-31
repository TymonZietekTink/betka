package pl.betka.connectors.authentication.service.connectors.pl.betclic.http.entity;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Token {
  private String auth;
  private String context;
  private int expires;

  //used for serialization purposes
  @JsonGetter("expiresIn")
  public int getExpires(){
    return 7199006;
  }
}
