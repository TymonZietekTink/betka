package pl.betka.connectors.fetching.service.common.domain;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.domain.FetchStatus;

@Builder
@Getter
public class FetchResult {
  private FetchStatus fetchStatus;
  private List<Ticket> tickets;
  private List<String> messages;
}
