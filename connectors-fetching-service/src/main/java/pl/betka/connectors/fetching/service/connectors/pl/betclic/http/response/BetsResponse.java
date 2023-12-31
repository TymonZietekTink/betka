package pl.betka.connectors.fetching.service.connectors.pl.betclic.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.Getter;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.entity.BetclicTicket;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BetsResponse {
  @JsonProperty("bets")
  private List<BetclicTicket> betclicTickets;
}
