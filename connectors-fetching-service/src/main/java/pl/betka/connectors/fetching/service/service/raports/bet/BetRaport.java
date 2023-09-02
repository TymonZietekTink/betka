package pl.betka.connectors.fetching.service.service.raports.bet;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors.fetching.service.service.entity.BetExcelModel;
import pl.betka.domain.model.valueobject.BetResult;

@Getter
@RequiredArgsConstructor
public class BetRaport {
  private final String name;
  private Set<BetsCategoryRaport> categoryRaports = new HashSet<>();

  public void addToRaport(BetExcelModel betExcelModel, String category) {
    BetsCategoryRaport betsCategoryRaport =
        categoryRaports.stream()
            .filter(raport -> raport.getCategory().equals(category))
            .findAny()
            .orElse(new BetsCategoryRaport(category));
    betsCategoryRaport.setNumberOfBets(betsCategoryRaport.getNumberOfBets().add(BigDecimal.ONE));
    if (betExcelModel.getBetResult().equals(BetResult.WIN)) {
      betsCategoryRaport
          .getDataCollector()
          .setNumberOfWins(
              betsCategoryRaport.getDataCollector().getNumberOfWins().add(BigDecimal.ONE));
      betsCategoryRaport.getDataCollector().getWinningOdds().add(betExcelModel.getOdds());
    } else {
      betsCategoryRaport
          .getDataCollector()
          .setNumberOfLoses(
              betsCategoryRaport.getDataCollector().getNumberOfLoses().add(BigDecimal.ONE));
    }
    categoryRaports.add(betsCategoryRaport);
  }

  public void enrichRaports() {
    categoryRaports.stream().forEach(BetsCategoryRaport::generateFullRaport);
  }
}
