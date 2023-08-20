package pl.betka.connectors.fetching.service.service.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.domain.model.valueobject.BetResult;
import pl.betka.domain.model.valueobject.Category;
import pl.betka.domain.model.valueobject.SelectionType;

@Builder
@Getter
public class BetExcelModel implements ExcelModel {
  private String eventName;
  private String eventType;
  private String betType;
  private String betSelection;
  private LocalDate eventDate;
  private Category category;
  private BigDecimal odds;
  private BetResult betResult;
  private SelectionType selectionType;

  @Override
  public List<String> generateExcelValues() {
    return List.of(
        eventName,
        eventType,
        betType,
        betSelection,
        String.valueOf(eventDate),
        category.name(),
        String.valueOf(odds),
        betResult.name(),
        selectionType.name());
  }
}
