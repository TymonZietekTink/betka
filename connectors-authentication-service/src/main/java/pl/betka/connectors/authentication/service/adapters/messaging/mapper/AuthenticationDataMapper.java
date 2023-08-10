package pl.betka.connectors.authentication.service.adapters.messaging.mapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import pl.betka.connectors.authentication.service.domain.event.AuthenticationCompletedEvent;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationRequestAvroModel;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationResponseAvroModel;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationStatus;

public class AuthenticationDataMapper {

  public static AuthenticationRequest authenticationRequestAvroModelToAuthenticationRequest(
      AuthenticationRequestAvroModel avroModel) {
    return AuthenticationRequest.builder()
        .id(avroModel.getId())
        .authenticationInputData(avroModel.getAuthenticationInputData())
        .connectorIdentifier(avroModel.getBookmakerIdentifier())
        .lastRefreshDate(avroModel.getLastRefresh())
        .build();
  }

  @SneakyThrows
  public static AuthenticationResponseAvroModel
      authenticationEventCompletedToAuthenticationResponseAvroModel(
          AuthenticationCompletedEvent event) {
    ObjectMapper mapper = new ObjectMapper();
    return AuthenticationResponseAvroModel.newBuilder()
        .setId(event.getAuthentication().getAuthenticationId().getValue())
        .setAuthenticationOutputData(mapper.writeValueAsString(event.getAuthentication().getSerializedAuthOutput()))
        .setAuthenticationStatus(
            AuthenticationStatus.valueOf(event.getAuthentication().getStatus().name()))
        .setErrorMessage(String.join("", event.getAuthentication().getFailureMessages()))
        .build();
  }
}
