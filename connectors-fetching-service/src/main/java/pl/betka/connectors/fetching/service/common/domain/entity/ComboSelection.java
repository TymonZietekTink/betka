package pl.betka.connectors.fetching.service.common.domain.entity;

import lombok.Getter;
import lombok.experimental.SuperBuilder;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.ComboSelectionId;
import pl.betka.domain.model.valueobject.ComboSelectionResult;

@SuperBuilder
@Getter
public class ComboSelection extends BaseEntity<ComboSelectionId> {
  private String bookmakerReference;
  //  eg. over 2.5 goals
  private String selection;
  //  eg. over goals
  private String selectionType;
  private ComboSelectionResult result;
}
