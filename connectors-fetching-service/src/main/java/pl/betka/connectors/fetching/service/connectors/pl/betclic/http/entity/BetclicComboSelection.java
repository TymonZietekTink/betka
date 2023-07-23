package pl.betka.connectors.fetching.service.connectors.pl.betclic.http.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BetclicComboSelection {
  @JsonProperty("selection_id")
  private String bookmakerReference;

  @JsonProperty("selection_label")
  private String selection;

  @JsonProperty("market_label")
  private String selectionType;

  @JsonProperty("result")
  private String result;
}
