package pl.betka.connectors.fetching.service.dataaccess.mapper;

import pl.betka.connectors.fetching.service.common.domain.entity.ComboSelection;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.ComboSelectionEntity;

public class ComboSelectionEntityMapper {
  public static ComboSelectionEntity mapToEntity(
      ComboSelection comboSelection, BetEntity betEntity) {
    return ComboSelectionEntity.builder()
        .id(comboSelection.getId().getValue())
        .selection(comboSelection.getSelection())
        .selectionType(comboSelection.getSelectionType())
        .betId(betEntity)
        .result(comboSelection.getResult())
        .build();
  }
}
