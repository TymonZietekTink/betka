package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors.fetching.service.service.entity.TicketExcelModel;

@RequiredArgsConstructor
@Getter
public class MonthTicketCollector {
  private final String name;
  private Set<MonthTicketPeriod> monthPeriods = new HashSet<>();

  public void addTicket(TicketExcelModel model) {
    int month = model.getCreatedAt().getMonthValue();
    int year = model.getCreatedAt().getYear();
    MonthTicketPeriod ticketPeriod =
        monthPeriods.stream()
            .filter(
                period ->
                    period.getMonthYear().getMonth() == month
                        && period.getMonthYear().getYear() == year)
            .findFirst()
            .orElse(new MonthTicketPeriod(new MonthYear(month, year)));

    ticketPeriod.getStakes().add(model.getStake());
    ticketPeriod.getMoneyOutcome().add(model.getMoneyOutcome());
    ticketPeriod.getBetSize().add(model.getNumbersOfBets());
    monthPeriods.add(ticketPeriod);
  }
}
