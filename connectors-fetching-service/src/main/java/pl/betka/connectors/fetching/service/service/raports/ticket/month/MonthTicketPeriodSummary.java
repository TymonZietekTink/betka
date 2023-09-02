package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class MonthTicketPeriodSummary implements Comparable<MonthYear> {
  private final MonthYear period;
  private final MonthTicketSummary summary;

  @Override
  public int compareTo(MonthYear o) {
    if (this.period.getMonth() == o.getMonth() && period.getYear() == o.getYear()) {
      return 0;
    }
    if (this.period.getMonth() > o.getMonth() && period.getYear() == o.getYear()
        || this.period.getYear() > o.getYear()) {
      return 1;
    }
    return -1;
  }
}
