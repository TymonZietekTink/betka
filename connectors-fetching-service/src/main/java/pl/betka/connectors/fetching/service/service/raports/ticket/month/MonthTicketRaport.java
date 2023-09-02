package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MonthTicketRaport {
  private String name;
  private List<MonthTicketPeriodSummary> monthPeriodSummaries = new ArrayList<>();
  private MonthTicketSummary summary;

  public  MonthTicketRaport(MonthTicketCollector collector) {
    this.setName(collector.getName());
    collector.getMonthPeriods().stream()
        .forEach(
            monthTicketPeriod -> {
              BigDecimal moneyOutcome =
                  monthTicketPeriod.getMoneyOutcome().stream()
                      .filter(money -> money.compareTo(BigDecimal.ZERO) > 0)
                      .reduce(BigDecimal.ZERO, BigDecimal::add);
              BigDecimal stakes =
                  monthTicketPeriod.getStakes().stream().reduce(BigDecimal.ZERO, BigDecimal::add);
              BigDecimal yield = moneyOutcome.subtract(stakes).divide(stakes, RoundingMode.HALF_UP);
              int numberOfTickets =
                  monthTicketPeriod.getBetSize().stream().mapToInt(Integer::intValue).sum();
              monthPeriodSummaries.add(
                  MonthTicketPeriodSummary.builder()
                      .period(monthTicketPeriod.getMonthYear())
                      .summary(
                          MonthTicketSummary.builder()
                              .stakes(stakes)
                              .moneyOutcome(moneyOutcome)
                              .numberOfTickets(numberOfTickets)
                              .yield(yield)
                              .build())
                      .build());
            });

    BigDecimal allStakes =
        this.monthPeriodSummaries.stream()
            .map(monthTicketPeriodSummary -> monthTicketPeriodSummary.getSummary().getStakes())
            .reduce(BigDecimal.ZERO, BigDecimal::add);
    BigDecimal allMoneyOutcome =
        this.monthPeriodSummaries.stream()
            .map(
                monthTicketPeriodSummary -> monthTicketPeriodSummary.getSummary().getMoneyOutcome())
            .reduce(BigDecimal.ZERO, BigDecimal::add);
    BigDecimal allYield = allMoneyOutcome.subtract(allStakes).divide(allStakes, RoundingMode.HALF_UP);
    int allNumberOfBets =
        this.monthPeriodSummaries.stream()
            .map(
                monthTicketPeriodSummary ->
                    monthTicketPeriodSummary.getSummary().getNumberOfTickets())
            .mapToInt(Integer::intValue)
            .sum();
    this.summary =
        MonthTicketSummary.builder()
            .moneyOutcome(allMoneyOutcome)
            .stakes(allStakes)
            .yield(allYield)
            .numberOfTickets(allNumberOfBets)
            .build();

    Collections.sort(monthPeriodSummaries, new Comparator<MonthTicketPeriodSummary>() {
      @Override
      public int compare(MonthTicketPeriodSummary o1, MonthTicketPeriodSummary o2) {
        return o1.compareTo(o2.getPeriod());
      }
    });
  }
}
