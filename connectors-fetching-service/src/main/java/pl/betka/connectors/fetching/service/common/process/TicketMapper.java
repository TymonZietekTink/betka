package pl.betka.connectors.fetching.service.common.process;

import java.util.List;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;

public interface TicketMapper<T> {
  List<Ticket> mapToTickets(T input);
}
