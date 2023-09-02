package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MonthYear {
  private int month;
  private int year;

  @Override
  public String toString() {
    return month+"/"+year;
  }
}
