package pl.betka.connectors.common.domain.fetching.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.List;
import lombok.Builder;
import pl.betka.connectors.common.domain.fetching.valueobject.BetResult;
import pl.betka.connectors.common.domain.fetching.valueobject.TicketResult;
import pl.betka.connectors.common.domain.fetching.valueobject.TicketType;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.TicketId;

@Builder
public class Ticket extends BaseEntity<TicketId> {
  private String bookmakerReference;
  // eg. single, multiple
  private TicketType ticketType;
  private LocalDate createdAt;
  List<Bet> betSelections;
  private BigDecimal odds;
  private BigDecimal stake;
  private TicketResult betResult;
  private BigDecimal tax;
}
