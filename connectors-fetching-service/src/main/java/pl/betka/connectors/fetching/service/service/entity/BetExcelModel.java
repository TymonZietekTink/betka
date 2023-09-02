package pl.betka.connectors.fetching.service.service.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
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
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (!(o instanceof BetExcelModel))
      return false;
    BetExcelModel that = (BetExcelModel) o;
    return eventName.equals(that.eventName) && eventType.equals(that.eventType) && betType.equals(
        that.betType) && betSelection.equals(that.betSelection);
  }

  @Override
  public int hashCode() {
    return Objects.hash(eventName, eventType, betType, betSelection);
  }

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
