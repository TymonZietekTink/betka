package pl.betka.connectors.fetching.service.dataaccess.adapter;

import java.util.List;
import java.util.Optional;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.ports.output.TicketsRepository;
import pl.betka.domain.model.TicketId;

public class BasicTicketsRepository implements TicketsRepository {

  @Override
  public Ticket saveOrUpdate(Ticket ticket) {
    return null;
  }

  @Override
  public List<Ticket> saveOrUpdateAll(List<Ticket> tickets) {
    return null;
  }

  @Override
  public Optional<Ticket> findById(TicketId ticketId) {
    return Optional.empty();
  }

  @Override
  public List<Ticket> getAll() {
    return null;
  }
}
