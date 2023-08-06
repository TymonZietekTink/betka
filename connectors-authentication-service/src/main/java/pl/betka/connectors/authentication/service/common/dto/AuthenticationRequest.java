package pl.betka.connectors.authentication.service.common.dto;

import java.util.UUID;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class AuthenticationRequest {
  private UUID id;
  private UUID userId;
  private String connectorIdentifier;
  private String authenticationInputData;
}
