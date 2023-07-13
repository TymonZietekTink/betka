package pl.betka.connectors.connectors.pl.betclic.fetching.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.Getter;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.entity.BetclicTicket;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BetsResponse {
  @JsonProperty("bets")
  private List<BetclicTicket> betclicTickets;
}
