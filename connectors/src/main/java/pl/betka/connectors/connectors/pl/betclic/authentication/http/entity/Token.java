package pl.betka.connectors.connectors.pl.betclic.authentication.http.entity;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
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
