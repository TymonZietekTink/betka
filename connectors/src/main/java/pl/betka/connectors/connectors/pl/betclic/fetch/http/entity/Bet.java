package pl.betka.connectors.connectors.pl.betclic.fetch.http.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class Bet {
  @JsonProperty("bet_reference")
  private String externalId;

  @JsonProperty("bet_type")
  private String betType;

  @JsonProperty("placed_date_utc")
  @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
  private LocalDate betDate;

  @JsonProperty("result")
  private String result;

  @JsonProperty("odds")
  private BigDecimal odds;

  @JsonProperty("stake")
  private BigDecimal stake;

  @JsonProperty("bet_selections")
  private List<BetSelection> betSelections;

  @JsonProperty("tax_on_stake")
  private BigDecimal tax;

  @JsonProperty("winnings")
  private BigDecimal win;
}
