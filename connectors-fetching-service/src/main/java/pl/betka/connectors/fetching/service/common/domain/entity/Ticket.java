package pl.betka.connectors.fetching.service.common.domain.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import lombok.Builder;
import pl.betka.connectors.fetching.service.common.domain.valueobject.TicketResult;
import pl.betka.connectors.fetching.service.common.domain.valueobject.TicketType;
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