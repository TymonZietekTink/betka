package pl.betka.connectors.authentication.service.domain.dto;

import java.time.LocalDate;
import java.util.UUID;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class AuthenticationRequest {
  private UUID id;
  private String connectorIdentifier;
  private String authenticationInputData;
  private LocalDate lastRefreshDate;
}
