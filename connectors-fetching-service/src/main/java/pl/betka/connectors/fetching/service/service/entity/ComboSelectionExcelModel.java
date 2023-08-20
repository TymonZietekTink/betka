package pl.betka.connectors.fetching.service.service.entity;

import java.util.List;
import java.util.UUID;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import lombok.Builder;
import lombok.Getter;
import pl.betka.domain.model.valueobject.ComboSelectionResult;

@Builder
@Getter
public class ComboSelectionExcelModel implements ExcelModel {
  private String selection;
  private String selectionType;
  private ComboSelectionResult result;

  @Override
  public List<String> generateExcelValues() {
    return List.of(selection, selectionType, result.name());
  }
}
