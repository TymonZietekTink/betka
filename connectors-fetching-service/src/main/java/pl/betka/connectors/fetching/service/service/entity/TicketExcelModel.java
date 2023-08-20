package pl.betka.connectors.fetching.service.service.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class TicketExcelModel implements ExcelModel {
  private LocalDate createdAt;
  private BigDecimal odds;
  private BigDecimal stake;
  private BigDecimal tax;
  private String result;
  private String type;
  private int numbers_of_bets;
  private BigDecimal moneyOutcome;

  @Override
  public List<String> generateExcelValues() {
    this.moneyOutcome = result.equals("LOSE")?stake.negate():stake;
    return List.of(
        String.valueOf(createdAt),
        String.valueOf(odds),
        String.valueOf(stake),
        String.valueOf(tax),
        result,
        type,
        String.valueOf(numbers_of_bets),
        String.valueOf(moneyOutcome));
  }
}
