package pl.betka.connectors.fetching.service.common.domain.dto;

import java.util.UUID;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class FetchRequest {
  private UUID id;
  private UUID userId;
  private String connectorIdentifier;
  private String fetchingInputData;
}
