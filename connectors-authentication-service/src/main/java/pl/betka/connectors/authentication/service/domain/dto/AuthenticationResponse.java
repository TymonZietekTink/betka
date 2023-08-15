package pl.betka.connectors.authentication.service.domain.dto;

import java.util.UUID;
import lombok.Builder;
import lombok.Getter;
import pl.betka.domain.AuthenticationStatus;

@Builder
@Getter
public class AuthenticationResponse {
  private UUID id;
  private UUID userId;
  private String connectorIdentifier;
  private String authenticationOutputData;
  private AuthenticationStatus authenticationStatus;
}
