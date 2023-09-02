package pl.betka.connectors.fetching.service.service.raports.bet;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BetCategoryDataCollector {
  private BigDecimal numberOfWins = BigDecimal.ZERO;
  private BigDecimal numberOfLoses = BigDecimal.ZERO;
  private List<BigDecimal> winningOdds = new ArrayList<>();
}
