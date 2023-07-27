package pl.betka.connectors.fetching.service.common.domain.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.TicketId;
import pl.betka.domain.model.valueobject.TicketResult;
import pl.betka.domain.model.valueobject.TicketType;

@SuperBuilder
@Getter
public class Ticket extends BaseEntity<TicketId> {
  private String bookmakerReference;
  // eg. single, multiple
  private TicketType ticketType;
  private LocalDate createdAt;
  Set<Bet> betSelections;
  private BigDecimal odds;
  private BigDecimal stake;
  private TicketResult ticketResult;
  private BigDecimal tax;
}
