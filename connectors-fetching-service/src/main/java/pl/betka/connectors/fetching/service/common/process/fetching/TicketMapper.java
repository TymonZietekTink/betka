package pl.betka.connectors.fetching.service.common.process.fetching;

import java.util.List;
import pl.betka.connectors.fetching.service.common.domain.fetching.entity.Ticket;

public interface TicketMapper<T> {
  List<Ticket> mapToTickets(T input);
}
