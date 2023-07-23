package pl.betka.connectors.fetching.service.ports.output;

import java.util.List;
import java.util.Optional;
import pl.betka.connectors.fetching.service.common.domain.entity.Bet;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.domain.model.BetId;
import pl.betka.domain.model.TicketId;

public interface BetsRepository {
  Optional<Bet> findById(BetId betId);

  Bet saveOrUpdate(BetId betId);

  List<Bet> saveOrUpdateAll(List<Bet> tickets);

  List<Bet> getAll();
}
