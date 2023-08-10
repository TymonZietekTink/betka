package pl.betka.connectors.authentication.service.domain.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import pl.betka.connectors.authentication.service.domain.model.Authentication;
import pl.betka.connectors.authentication.service.domain.event.AuthenticationCompletedEvent;
import pl.betka.connectors.authentication.service.domain.event.AuthenticationEvent;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.connectors.authentication.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.authentication.service.ports.input.message.listener.AuthenticationRequestMessageProcessor;
import pl.betka.connectors.authentication.service.ports.output.message.publisher.AuthenticationCompletedMessagePublisher;
import pl.betka.connectors_configuration.pl.betclic.BetclicUserInfo;

@RequiredArgsConstructor
@Slf4j
@Service
public class BasicAuthenticationRequestMessageProcessor implements
    AuthenticationRequestMessageProcessor {
  private final ConnectorsRegistry connectorsRegistry;
  private final AuthenticationCompletedMessagePublisher authenticationCompletedMessagePublisher;

  @SneakyThrows
  @Override
  public void processAuthenticationRequest(AuthenticationRequest authenticationRequest) {
      Authentication authentication = AuthenticationRequestMapper.authenticationRequestToAuthenticationModel(authenticationRequest);
      var connectoridentifier = authentication.getBookmakerIdentifier();
      var connector = connectorsRegistry.getAuthenticationService(connectoridentifier);
      //todo change it to real implementation
      ObjectMapper objectMapper = new ObjectMapper();
      BetclicUserInfo userInfo = objectMapper.readValue(authentication.getSerializedUserInfo(), BetclicUserInfo.class);
      var authResponse = connector.authenticate(userInfo);
      authentication.setStatus(authResponse.getAuthenticationStatus());
      authentication.setFailureMessages(authResponse.getFailureMessages());
      authentication.setSerializedAuthOutput(objectMapper.writeValueAsString(authResponse.getAuthData()));
      var event = new AuthenticationCompletedEvent(authentication, authenticationCompletedMessagePublisher);
      fireEvent(event);
  }

  private void fireEvent(AuthenticationEvent authenticationEvent) {
    log.info("Publishing authentication event with authentication id");
    authenticationEvent.fire();
  }
}
