package pl.betka.connectors.fetching.service.service.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.domain.model.valueobject.BetResult;
import pl.betka.domain.model.valueobject.Category;

@Builder
@Getter
public class TicketExcelModel implements ExcelModel {
  private LocalDate createdAt;
  private BigDecimal odds;
  private BigDecimal stake;
  private BigDecimal tax;
  private String result;
  private String type;
  private int numbersOfBets;
  private BigDecimal moneyOutcome;
  private Set<BetEntity> bets;

  @Override
  public List<String> generateExcelValues() {
    this.moneyOutcome = result.equals("LOSE")?stake.add(tax).negate():stake.multiply(odds);
    return List.of(
        String.valueOf(createdAt),
        String.valueOf(odds),
        String.valueOf(stake),
        String.valueOf(tax),
        result,
        type,
        String.valueOf(numbersOfBets),
        String.valueOf(moneyOutcome));
  }

  public boolean isOnlyFootballTicket(){
    return bets.stream().allMatch(betEntity -> betEntity.getCategory().equals(Category.FOOTBALL));
  }
  public boolean areOnlyReasonableBets(){
    return bets.stream().noneMatch(betEntity -> betEntity.getOdds().compareTo(BigDecimal.valueOf(4)) > 0);
  }

  public boolean isOnlyOneFailedBetTicket(){
    List<BetEntity> failedBets = new ArrayList<>();
    List<BetEntity> notFailedBets = new ArrayList<>();
    bets.stream().forEach(betEntity -> {
      if(betEntity.getBetResult().equals(BetResult.LOSE)){
        failedBets.add(betEntity);
      } else {
        notFailedBets.add(betEntity);
      }
    });
    return failedBets.size() == 1;
  }
}
