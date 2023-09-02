package pl.betka.connectors.fetching.service.service.raports.ticket.month;

import java.math.BigDecimal;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class MonthTicketSummary {
  private final BigDecimal stakes;
  private final BigDecimal moneyOutcome;
  private final BigDecimal yield;
  private final int numberOfTickets;
}
