package pl.betka.connectors.connectors.pl.betclic.fetching.http.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.math.BigDecimal;
import java.time.LocalDate;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@EqualsAndHashCode
public class BetclicBet {
  @JsonProperty("id")
  private long externalId;

  @JsonProperty("match_date_utc")
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
  private LocalDate betDate;

  @JsonProperty("odds")
  private BigDecimal odds;

  @JsonProperty("selection_label")
  private String selection;

  @JsonProperty("market_label")
  private String selectionLabel;

  @JsonProperty("match_label")
  private String eventName;

  @JsonProperty("sport_label")
  private String category;

  @JsonProperty("competition_label")
  private String competitionType;

  @JsonProperty("result")
  private String result;

  @JsonProperty("selection_type")
  private String selectionType;

  @JsonProperty("match_status")
  private String eventStatus;
}
