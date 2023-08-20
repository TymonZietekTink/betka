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
  private final ComboSelectionJpaRepository comboSelectionJpaRepository;

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

  public void generateCsvFiles() {
    Workbook workbook = new HSSFWorkbook();
    generateTicketsCsv(workbook.createSheet("tickets"));
    generateBetsCsv(workbook.createSheet("bets"));
    generateComboSelectionsCsv(workbook.createSheet("comboSelections"));
    ExcelSheet.writeToFile("raport.xls", workbook);
  }

  private void generateTicketsCsv(Sheet sheet) {
    List<TicketEntity> tickets = ticketRpository.findAll();
    List<String> headers =
        List.of(
            "createdAt",
            "odds",
            "stake",
            "tax",
            "result",
            "type",
            "numbers_of_bets",
            "money_outcome");
    ExcelValuesContainer excelValuesContainer = new ExcelValuesContainer();
    tickets.stream()
        .map(
            ticketEntity ->
                TicketExcelModel.builder()
                    .createdAt(ticketEntity.getCreatedAt())
                    .odds(ticketEntity.getOdds())
                    .stake(ticketEntity.getStake())
                    .tax(ticketEntity.getTax())
                    .result(ticketEntity.getTicketResult().name())
                    .type(ticketEntity.getTicketType().name())
                    .numbers_of_bets(ticketEntity.getBetSelections().size())
                    .build())
        .forEach(model -> excelValuesContainer.add(model));
    ExcelSheet.generateTable(sheet, headers, excelValuesContainer);
  }

  private void generateBetsCsv(Sheet sheet) {
    List<BetEntity> betEntities = betJpaRepository.findAll();
    ExcelValuesContainer excelValuesContainer = new ExcelValuesContainer();
    betEntities.stream()
        .map(
            betEntity ->
                BetExcelModel.builder()
                    .eventName(betEntity.getEventName())
                    .eventType(betEntity.getEventType())
                    .betType(betEntity.getBetType())
                    .betSelection(betEntity.getBetSelection())
                    .eventDate(betEntity.getEventDate())
                    .category(betEntity.getCategory())
                    .odds(betEntity.getOdds())
                    .betResult(betEntity.getBetResult())
                    .selectionType(betEntity.getSelectionType())
                    .build())
        .forEach(betExcelModel -> excelValuesContainer.add(betExcelModel));
    List<String> headers =
        List.of(
            "event_name",
            "event_type",
            "bet_type",
            "bet_selection",
            "event_date",
            "category",
            "odds",
            "bet_result",
            "selection_type");
    ExcelSheet.generateTable(sheet, headers, excelValuesContainer);
  }

  private void generateComboSelectionsCsv(Sheet sheet) {
    List<ComboSelectionEntity> entities = comboSelectionJpaRepository.findAll();
    ExcelValuesContainer excelValuesContainer = new ExcelValuesContainer();
    entities.stream()
        .map(
            entity ->
                ComboSelectionExcelModel.builder()
                    .selection(entity.getSelection())
                    .selectionType(entity.getSelectionType())
                    .result(entity.getResult())
                    .build())
        .forEach(model -> excelValuesContainer.add(model));
    List<String> headers = List.of("selection", "selection_type", "result");
    ExcelSheet.generateTable(sheet, headers, excelValuesContainer);
  }
}
