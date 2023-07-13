package pl.betka.connectors.connectors.pl.betclic.http.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Digest {
  private String type;

  @JsonProperty("id")
  private String digestId;
}
