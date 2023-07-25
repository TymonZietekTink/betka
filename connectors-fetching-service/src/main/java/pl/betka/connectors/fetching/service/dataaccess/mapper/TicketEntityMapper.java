package pl.betka.connectors.fetching.service.dataaccess.mapper;

import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.stereotype.Component;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.TicketEntity;

@Component
public class TicketEntityMapper {

  public static TicketEntity mapToEntity(Ticket ticket, String connectorIdentifier) {
    TicketEntity ticketEntity =
        TicketEntity.builder()
            .id(ticket.getId().getValue())
            .bookmakerReference(ticket.getBookmakerReference())
            .ticketType(ticket.getTicketType())
            .createdAt(ticket.getCreatedAt())
            .odds(ticket.getOdds())
            .stake(ticket.getStake())
            .ticketResult(ticket.getTicketResult())
            .tax(ticket.getTax())
            .connectorIdentifier(connectorIdentifier)
            .build();

    Set<BetEntity> betSelections =
        ticket.getBetSelections().stream()
            .map(bet -> BetEntityMapper.mapToEntity(bet, ticketEntity))
            .collect(Collectors.toSet());
    ticketEntity.setBetSelections(betSelections);
    return ticketEntity;
  }
}
