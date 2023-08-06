package pl.betka.connectors.authentication.service.adapters.messaging.mapper;

import pl.betka.connectors.authentication.service.common.dto.AuthenticationRequest;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationRequestAvroModel;

public class AuthenticationRequestDataMapper {

  public static AuthenticationRequest authenticationRequestAvroModelToAuthenticationRequest(
      AuthenticationRequestAvroModel avroModel){
    return AuthenticationRequest.builder()
        .id(avroModel.getId())
        .authenticationInputData(avroModel.getAuthenticationInputData())
        .connectorIdentifier(avroModel.getBookmakerIdentifier())
        .userId(avroModel.getUserId())
        .build();
  }
}
