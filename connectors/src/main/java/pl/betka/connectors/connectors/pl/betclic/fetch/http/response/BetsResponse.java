package pl.betka.connectors.connectors.pl.betclic.fetch.http.response;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;
import lombok.Getter;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.entity.Bet;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class BetsResponse {
  private List<Bet> bets;
}
