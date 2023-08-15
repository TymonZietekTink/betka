package pl.betka.connectors.fetching.service.common.domain.dto;

import java.util.UUID;
import pl.betka.domain.FetchStatus;

public class FetchResponse {
  private UUID id;
  private UUID userId;
  private String connectorIdentifier;
  private FetchStatus fetchStatus;
}
