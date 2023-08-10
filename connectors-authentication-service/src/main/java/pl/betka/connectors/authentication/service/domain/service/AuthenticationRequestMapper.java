package pl.betka.connectors.authentication.service.domain.service;

import java.util.UUID;
import pl.betka.connectors.authentication.service.domain.model.Authentication;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.domain.model.AuthenticationId;

public class AuthenticationRequestMapper {
  public static Authentication authenticationRequestToAuthenticationModel(AuthenticationRequest request){
    return Authentication.builder()
        .authenticationId(new AuthenticationId(UUID.fromString(request.getId().toString())))
        .bookmakerIdentifier(request.getConnectorIdentifier())
        .serializedUserInfo(request.getAuthenticationInputData())
        .lastRefreshDate(request.getLastRefreshDate())
        .build();
  }
}
