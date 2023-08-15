package pl.betka.connectors.fetching.service.service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.dataaccess.entity.TicketEntity;
import pl.betka.connectors.fetching.service.dataaccess.mapper.TicketEntityMapper;
import pl.betka.connectors.fetching.service.dataaccess.repository.BetJpaRepository;
import pl.betka.connectors.fetching.service.dataaccess.repository.TicketJpaRepository;

@Service
@RequiredArgsConstructor
public class FetchingService {
  private final TicketJpaRepository ticketRpository;
  private final BetJpaRepository betJpaRepository;

  public void persistTickets(List<Ticket> tickets, String connectorIdentifier) {
    var maxDate = betJpaRepository.getMaxDateBetInStorage().orElse(LocalDate.MIN);
    List<TicketEntity> entities =
        tickets.stream()
            .filter(
                ticket -> {
                  var bets = ticket.getBetSelections();
                  return bets.stream().anyMatch(bet -> bet.getEventDate().isAfter(maxDate));
                })
            .map(ticket -> TicketEntityMapper.mapToEntity(ticket, "pl-betclic-http"))
            .toList();
    ticketRpository.saveAll(entities);
  }
}
