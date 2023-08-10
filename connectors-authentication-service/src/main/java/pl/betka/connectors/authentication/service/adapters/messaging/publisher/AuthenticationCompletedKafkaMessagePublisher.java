package pl.betka.connectors.authentication.service.adapters.messaging.publisher;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import pl.betka.connectors.authentication.service.adapters.messaging.config.AuthenticationMessagingConfig;
import pl.betka.connectors.authentication.service.adapters.messaging.mapper.AuthenticationDataMapper;
import pl.betka.connectors.authentication.service.domain.event.AuthenticationCompletedEvent;
import pl.betka.connectors.authentication.service.ports.output.message.publisher.AuthenticationCompletedMessagePublisher;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationResponseAvroModel;
import pl.betka.infrastructure.kafka.producer.KafkaMessageHelper;
import pl.betka.infrastructure.kafka.producer.service.KafkaProducer;

@Component
@Slf4j
@RequiredArgsConstructor
public class AuthenticationCompletedKafkaMessagePublisher implements
    AuthenticationCompletedMessagePublisher {
  private final KafkaProducer<String, AuthenticationResponseAvroModel> kafkaProducer;
  private final AuthenticationMessagingConfig messagingConfig;
  private final KafkaMessageHelper messageHelper;

  @Override
  public void publish(AuthenticationCompletedEvent domainEvent) {
    String authenticationId = domainEvent.getAuthentication().getAuthenticationId().getValue().toString();

    log.info("Received AuthenticationCompletedEvent for authentication id: {}", authenticationId);

    try {
      AuthenticationResponseAvroModel authenticationResponseAvroModel =
          AuthenticationDataMapper.authenticationEventCompletedToAuthenticationResponseAvroModel(domainEvent);

      kafkaProducer.send(messagingConfig.getAuthenticationResponseTopicName(),
          authenticationId,
          authenticationResponseAvroModel,
          messageHelper.getKafkaCallback(messagingConfig.getAuthenticationResponseTopicName(),
              authenticationResponseAvroModel,
              authenticationId,
              "AuthenticationResponseAvroModel"));

      log.info("AuthenticationResponseAvroModel sent to kafka for authentication id: {}", authenticationId);
    } catch (Exception e) {
      log.error("Error while sending AuthenticationResponseAvroModel message" +
          " to kafka with order id: {}, error: {}", authenticationId, e.getMessage());
    }
  }
}
