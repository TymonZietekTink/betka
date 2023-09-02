package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class MonthTicketPeriod {
  private final MonthYear monthYear;
  private List<BigDecimal> stakes = new ArrayList<>();
  private List<BigDecimal> moneyOutcome = new ArrayList<>();
  private List<Integer> betSize = new ArrayList<>();

  @Override
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (!(o instanceof MonthTicketPeriod))
      return false;
    MonthTicketPeriod that = (MonthTicketPeriod) o;
    return monthYear.equals(that.monthYear);
  }

  @Override
  public int hashCode() {
    return Objects.hash(monthYear);
  }
}
