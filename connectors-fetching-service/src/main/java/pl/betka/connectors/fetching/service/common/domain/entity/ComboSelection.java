package pl.betka.connectors.fetching.service.common.domain.entity;

import lombok.Builder;
import pl.betka.connectors.fetching.service.common.domain.valueobject.ComboSelectionResult;

@Builder
public class ComboSelection {
  private String bookmakerReference;
  //  eg. over 2.5 goals
  private String selection;
  //  eg. over goals
  private String selectionType;
  private ComboSelectionResult result;
}
