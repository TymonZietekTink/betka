package pl.betka.connectors.fetching.service.dataaccess.adapter;

import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Component;
import pl.betka.connectors.fetching.service.common.domain.entity.Bet;
import pl.betka.connectors.fetching.service.ports.output.BetsRepository;
import pl.betka.domain.model.BetId;

@Component
public class BasicBetsRepository implements BetsRepository {

  @Override
  public Optional<Bet> findById(BetId betId) {
    return null;
  }

  @Override
  public Bet saveOrUpdate(BetId betId) {
    return null;
  }

  @Override
  public List<Bet> saveOrUpdateAll(List<Bet> tickets) {
    return null;
  }

  @Override
  public List<Bet> getAll() {
    return null;
  }
}
