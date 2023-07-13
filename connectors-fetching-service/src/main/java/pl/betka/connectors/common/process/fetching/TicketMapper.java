package pl.betka.connectors.common.process.fetching;

import java.util.List;
import pl.betka.connectors.common.domain.fetching.entity.Ticket;

public interface TicketMapper<T> {
  List<Ticket> mapToTickets(T input);
}
