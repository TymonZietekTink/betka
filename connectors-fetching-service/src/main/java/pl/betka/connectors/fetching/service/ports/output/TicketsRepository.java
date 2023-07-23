package pl.betka.connectors.fetching.service.ports.output;

import java.util.List;
import java.util.Optional;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.domain.model.TicketId;

public interface TicketsRepository {
  Ticket saveOrUpdate(Ticket ticket);

  List<Ticket> saveOrUpdateAll(List<Ticket> tickets);

  Optional<Ticket> findById(TicketId ticketId);

  List<Ticket> getAll();
}
