package pl.betka.connectors.fetching.service.common.domain.entity;

import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import pl.betka.connectors.fetching.service.common.domain.valueobject.ComboSelectionResult;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.ComboSelectionId;

@Builder
@EqualsAndHashCode
@Getter
public class ComboSelection extends BaseEntity<ComboSelectionId> {
  private String bookmakerReference;
  //  eg. over 2.5 goals
  private String selection;
  //  eg. over goals
  private String selectionType;
  private ComboSelectionResult result;
}
