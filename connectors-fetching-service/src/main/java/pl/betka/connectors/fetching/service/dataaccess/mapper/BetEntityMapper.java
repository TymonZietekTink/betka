package pl.betka.connectors.fetching.service.dataaccess.mapper;

import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.stereotype.Component;
import pl.betka.connectors.fetching.service.common.domain.entity.Bet;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.ComboSelectionEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.TicketEntity;

@Component
public class BetEntityMapper {
  public static BetEntity mapToEntity(Bet bet, TicketEntity ticketEntity) {
    BetEntity betEntity =
        BetEntity.builder()
            .id(bet.getId().getValue())
            .bookmakerReference(bet.getBookmakerReference())
            .betSelection(bet.getBetSelection())
            .betType(bet.getBetType())
            .eventName(bet.getEventName())
            .eventDate(bet.getEventDate())
            .eventType(bet.getEventType())
            .eventStatus(bet.getEventStatus())
            .category(bet.getCategory())
            .odds(bet.getOdds())
            .selectionType(bet.getSelectionType())
            .betResult(bet.getBetResult())
            .ticketId(ticketEntity)
            .build();

    if(bet.getComboSelections()!=null){
      Set<ComboSelectionEntity> comboSelections =
          bet.getComboSelections().stream()
              .map(combo -> ComboSelectionEntityMapper.mapToEntity(combo, betEntity))
              .collect(Collectors.toSet());
      betEntity.setComboSelections(comboSelections);
    }
    return betEntity;
  }
}
