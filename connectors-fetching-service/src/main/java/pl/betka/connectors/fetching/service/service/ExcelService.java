package pl.betka.connectors.fetching.service.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.ComboSelectionEntity;
import pl.betka.connectors.fetching.service.dataaccess.entity.TicketEntity;
import pl.betka.connectors.fetching.service.dataaccess.repository.BetJpaRepository;
import pl.betka.connectors.fetching.service.dataaccess.repository.ComboSelectionJpaRepository;
import pl.betka.connectors.fetching.service.dataaccess.repository.TicketJpaRepository;
import pl.betka.connectors.fetching.service.service.entity.BetExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ComboSelectionExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ExcelValuesContainer;
import pl.betka.connectors.fetching.service.service.entity.TicketExcelModel;
import pl.betka.connectors.fetching.service.service.raports.bet.BetRaport;
import pl.betka.connectors.fetching.service.service.raports.ticket.month.MonthTicketCollector;
import pl.betka.connectors.fetching.service.service.raports.ticket.month.MonthTicketRaport;
import pl.betka.domain.model.valueobject.Category;

@Service
@RequiredArgsConstructor
public class ExcelService {
  private static final List<String> TICKETS_HEADERS =
      List.of(
          "createdAt",
          "odds",
          "stake",
          "tax",
          "result",
          "type",
          "numbers_of_bets",
          "money_outcome");
  private static final List<String> BETS_HEADERS =
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
  private static final List<String> COMBO_HEADERS =
      List.of("selection", "selection_type", "result");

  private final TicketJpaRepository ticketRpository;
  private final BetJpaRepository betJpaRepository;
  private final ComboSelectionJpaRepository comboSelectionJpaRepository;

  public void generateRaport() {
    ExcelValuesContainer ticketContainer = buildTicketContainer();
    ExcelValuesContainer betContainer = buildBetContainer();
    ExcelValuesContainer comboContainer = buildComboContainer();

    Workbook workbook = new HSSFWorkbook();
    ExcelSheet.generateTable(workbook.createSheet("tickets"), TICKETS_HEADERS, ticketContainer);
    ExcelSheet.generateTable(workbook.createSheet("bets"), BETS_HEADERS, betContainer);
    ExcelSheet.generateTable(
        workbook.createSheet("comboSelections"), COMBO_HEADERS, comboContainer);
    generateTicketStats(workbook.createSheet("ticket_stats"), ticketContainer);
    generateBetStats(workbook.createSheet("bet_stats"), betContainer);
    ExcelSheet.writeToFile("raport.xls", workbook);
  }

  private ExcelValuesContainer buildComboContainer() {
    ExcelValuesContainer container = new ExcelValuesContainer();
    List<ComboSelectionEntity> entities = comboSelectionJpaRepository.findAll();
    entities.stream()
        .map(
            entity ->
                ComboSelectionExcelModel.builder()
                    .selection(entity.getSelection())
                    .selectionType(entity.getSelectionType())
                    .result(entity.getResult())
                    .build())
        .forEach(model -> container.add(model));
    return container;
  }

  private ExcelValuesContainer buildTicketContainer() {
    ExcelValuesContainer container = new ExcelValuesContainer();
    List<TicketEntity> tickets = ticketRpository.findAll();
    tickets.stream()
        .map(
            ticketEntity ->
                TicketExcelModel.builder()
                    .createdAt(ticketEntity.getCreatedAt())
                    .odds(ticketEntity.getOdds())
                    .stake(ticketEntity.getStake().add(ticketEntity.getTax()))
                    .tax(ticketEntity.getTax())
                    .result(ticketEntity.getTicketResult().name())
                    .type(ticketEntity.getTicketType().name())
                    .numbersOfBets(ticketEntity.getBetSelections().size())
                    .bets(ticketEntity.getBetSelections())
                    .build())
        .forEach(model -> container.add(model));
    return container;
  }

  private ExcelValuesContainer buildBetContainer() {
    ExcelValuesContainer container = new ExcelValuesContainer();
    List<BetEntity> betEntities = betJpaRepository.findAll();
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
        .forEach(betExcelModel -> container.add(betExcelModel));
    return container;
  }

  private void generateTicketStats(Sheet sheet, ExcelValuesContainer ticketContainer) {
    // month statistics
    List<MonthTicketCollector> collectors = new ArrayList<>();
    List<TicketExcelModel> excelModels =
        ticketContainer.getCellValues().stream()
            .map(ticketModel -> (TicketExcelModel) ticketModel)
            .toList();
    collectors.add(generateMonthTicketStats(model -> true, excelModels, "all bets"));

    List<TicketExcelModel> onlyFootballReasonableTickets =
        excelModels.stream()
            .filter(TicketExcelModel::isOnlyFootballTicket)
            .filter(TicketExcelModel::areOnlyReasonableBets)
            .toList();
    collectors.add(
        generateMonthTicketStats(
            model -> true, onlyFootballReasonableTickets, "all football tickets with odds < 4"));
    collectors.add(
        generateMonthTicketStats(
            model -> model.getNumbersOfBets() > 8,
            onlyFootballReasonableTickets,
            "all football tickets with bet odds <4 number of bets > 8"));
    collectors.add(
        generateMonthTicketStats(
            model -> model.getNumbersOfBets() > 4 && model.getNumbersOfBets() <= 8,
            onlyFootballReasonableTickets,
            "all football tickets with bet odds < 4 and number of bets between 4 and 8"));
    collectors.add(
        generateMonthTicketStats(
            model -> model.getNumbersOfBets() <= 4,
            onlyFootballReasonableTickets,
            "all football tickets with bet odds <4 and number of bets < 4"));

    List<MonthTicketRaport> raports = collectors.stream().map(MonthTicketRaport::new).toList();

    ExcelSheet.generateTicketMonthPeriodStatistics(raports, sheet);
    // other
    int numberOfOneBetFailedTickets =
        onlyFootballReasonableTickets.stream()
            .filter(TicketExcelModel::isOnlyOneFailedBetTicket)
            .filter(model -> model.getBets().size() > 3)
            .toList()
            .size();

    int numberOfOneBetFailedTicketsDivider =
        onlyFootballReasonableTickets.stream()
            .filter(model -> model.getBets().size() > 3)
            .toList()
            .size();

    BigDecimal oneFailedBetRatio =
        BigDecimal.valueOf(numberOfOneBetFailedTickets)
            .divide(BigDecimal.valueOf(numberOfOneBetFailedTicketsDivider), RoundingMode.HALF_UP);

    ExcelSheet.generateOneFailedBetRaport(sheet, oneFailedBetRatio);
  }

  private MonthTicketCollector generateMonthTicketStats(
      Predicate<TicketExcelModel> predicate, List<TicketExcelModel> models, String collectorTitle) {
    MonthTicketCollector collector = new MonthTicketCollector(collectorTitle);
    models.stream().filter(predicate).forEach(collector::addTicket);
    return collector;
  }

  private void generateBetStats(Sheet sheet, ExcelValuesContainer betContainer) {
    Set<BetExcelModel> modelsOnlyFootball =
        betContainer.getCellValues().stream()
            .map(ticketModel -> (BetExcelModel) ticketModel)
            .filter(betExcelModel -> betExcelModel.getCategory().equals(Category.FOOTBALL))
            .collect(Collectors.toSet());

    BetRaport eventTypeAllFootballRaport = new BetRaport("event_type_football");
    modelsOnlyFootball.forEach(
        model -> {
          eventTypeAllFootballRaport.addToRaport(model, model.getEventType());
        });
    eventTypeAllFootballRaport.enrichRaports();

    BetRaport betTypeAllFootball = new BetRaport("bet_type_football");
    modelsOnlyFootball.forEach(
        model -> {
          betTypeAllFootball.addToRaport(model, model.getBetType());
        });
    betTypeAllFootball.enrichRaports();

    Set<BetExcelModel> modelsOnlyFootballUnder4OddsOnlyWinsAndLoses =
        modelsOnlyFootball.stream()
            .filter(model -> model.getOdds().compareTo(BigDecimal.valueOf(4)) < 0)
            .filter(
                model ->
                    model.getBetType().equals("Wynik meczu (z wyłączeniem dogrywki)")
                        || model.getBetType().equals("Handicap"))
            .collect(Collectors.toSet());

    BetRaport eventTypeAllFootballUnder4MatchResultRaport =
        new BetRaport("event_type_football_under_4_match_result");
    modelsOnlyFootballUnder4OddsOnlyWinsAndLoses.forEach(
        model -> {
          eventTypeAllFootballUnder4MatchResultRaport.addToRaport(model, model.getEventType());
        });
    eventTypeAllFootballUnder4MatchResultRaport.enrichRaports();

    BetRaport betTypeAllFootballUnder4MatchResultRaport =
        new BetRaport("bet_type_football_under_4_match_result");
    modelsOnlyFootballUnder4OddsOnlyWinsAndLoses.forEach(
        model -> {
          betTypeAllFootballUnder4MatchResultRaport.addToRaport(model, model.getBetType());
        });
    betTypeAllFootballUnder4MatchResultRaport.enrichRaports();

    Set<BetExcelModel> modelsOnlyFootballUnder2OddsOnlyWinsAndLoses =
        modelsOnlyFootballUnder4OddsOnlyWinsAndLoses.stream()
            .filter(model -> model.getOdds().compareTo(BigDecimal.valueOf(2)) < 0)
            .collect(Collectors.toSet());

    BetRaport eventTypeAllFootballUnder2MatchResultRaport =
        new BetRaport("event_type_football_under_2_match_result");
    modelsOnlyFootballUnder2OddsOnlyWinsAndLoses.forEach(
        model -> {
          eventTypeAllFootballUnder2MatchResultRaport.addToRaport(model, model.getEventType());
        });
    eventTypeAllFootballUnder2MatchResultRaport.enrichRaports();

    BetRaport betTypeAllFootballUnder2MatchResultRaport =
        new BetRaport("bet_type_football_under_2_match_result");
    modelsOnlyFootballUnder2OddsOnlyWinsAndLoses.forEach(
        model -> {
          betTypeAllFootballUnder2MatchResultRaport.addToRaport(model, model.getBetType());
        });
    betTypeAllFootballUnder2MatchResultRaport.enrichRaports();

    Set<BetExcelModel> modelsOnlyFootballUnder15OddsOnlyWinsAndLoses =
        modelsOnlyFootballUnder4OddsOnlyWinsAndLoses.stream()
            .filter(model -> model.getOdds().compareTo(BigDecimal.valueOf(1.5)) < 0)
            .collect(Collectors.toSet());

    BetRaport eventTypeAllFootballUnder15MatchResultRaport =
        new BetRaport("event_type_football_under_1.5_match_result");
    modelsOnlyFootballUnder15OddsOnlyWinsAndLoses.forEach(
        model -> {
          eventTypeAllFootballUnder15MatchResultRaport.addToRaport(model, model.getEventType());
        });
    eventTypeAllFootballUnder15MatchResultRaport.enrichRaports();

    BetRaport betTypeAllFootballUnder15MatchResultRaport =
        new BetRaport("bet_type_football_under_1.5_match_result");
    modelsOnlyFootballUnder15OddsOnlyWinsAndLoses.forEach(
        model -> {
          betTypeAllFootballUnder15MatchResultRaport.addToRaport(model, model.getBetType());
        });
    betTypeAllFootballUnder15MatchResultRaport.enrichRaports();

    List<BetRaport> raports =
        List.of(
            eventTypeAllFootballRaport,
            betTypeAllFootball,
            eventTypeAllFootballUnder4MatchResultRaport,
            betTypeAllFootballUnder4MatchResultRaport,
            eventTypeAllFootballUnder2MatchResultRaport,
            betTypeAllFootballUnder2MatchResultRaport,
            eventTypeAllFootballUnder15MatchResultRaport,
            betTypeAllFootballUnder15MatchResultRaport);

    ExcelSheet.writeBetRaports(raports,sheet);
  }
}
