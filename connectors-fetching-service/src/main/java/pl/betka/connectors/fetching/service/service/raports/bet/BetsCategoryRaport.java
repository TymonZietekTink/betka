package pl.betka.connectors.fetching.service.service.raports.bet;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.naming.ldap.spi.LdapDnsProvider;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class BetsCategoryRaport {
  private final String category;
  private BigDecimal numberOfBets = BigDecimal.ZERO;
  private BigDecimal ratio;
  private BigDecimal yield;
  private BetCategoryDataCollector dataCollector = new BetCategoryDataCollector();

  public void generateFullRaport() {
    this.ratio = dataCollector.getNumberOfWins().divide(numberOfBets, MathContext.DECIMAL32);
    this.yield =
        dataCollector.getWinningOdds().stream()
            .reduce(BigDecimal.ZERO, BigDecimal::add)
            .subtract(numberOfBets)
            .divide(numberOfBets, MathContext.DECIMAL32);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (!(o instanceof BetsCategoryRaport))
      return false;
    BetsCategoryRaport raport = (BetsCategoryRaport) o;
    return Objects.equals(category, raport.category);
  }

  @Override
  public int hashCode() {
    return Objects.hash(category);
  }
}
