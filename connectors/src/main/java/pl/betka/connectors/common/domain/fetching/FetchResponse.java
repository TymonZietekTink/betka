package pl.betka.connectors.common.domain.fetching;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import pl.betka.connectors.common.domain.fetching.entity.Ticket;
import pl.betka.domain.FetchStatus;

@Builder
@Getter
public class FetchResponse {
  private FetchStatus fetchStatus;
  private List<Ticket> tickets;
  private List<String> messages;
}
