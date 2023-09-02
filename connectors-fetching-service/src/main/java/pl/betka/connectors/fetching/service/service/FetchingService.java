package pl.betka.connectors.fetching.service.service;

import java.time.LocalDate;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.ComboSelectionEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.TicketEntity;
import pl.betka.connectors.fetching.service.dataaccess.mapper.TicketEntityMapper;
import pl.betka.connectors.fetching.service.dataaccess.repository.BetJpaRepository;
import pl.betka.connectors.fetching.service.dataaccess.repository.ComboSelectionJpaRepository;
import pl.betka.connectors.fetching.service.dataaccess.repository.TicketJpaRepository;
import pl.betka.connectors.fetching.service.service.entity.BetExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ComboSelectionExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ExcelValuesContainer;
import pl.betka.connectors.fetching.service.service.entity.TicketExcelModel;

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
