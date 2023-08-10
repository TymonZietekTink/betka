package pl.betka.connectors.authentication.service.adapters.messaging.listener;

import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import pl.betka.connectors.authentication.service.domain.dto.AuthenticationRequest;
import pl.betka.connectors.authentication.service.adapters.messaging.mapper.AuthenticationDataMapper;
import pl.betka.connectors.authentication.service.ports.input.message.listener.AuthenticationRequestMessageProcessor;
import pl.betka.infrastructure.kafka.consumer.KafkaConsumer;
import pl.betka.infrastructure.kafka.model.avro.AuthenticationRequestAvroModel;

@Slf4j
@RequiredArgsConstructor
public class AuthenticationKafkaRequestListener
    implements KafkaConsumer<AuthenticationRequestAvroModel> {

  private final AuthenticationRequestMessageProcessor messageProcessor;

  @Override
  @KafkaListener(
      id = "${kafka-consumer-config.authentication-consumer-group-id}",
      topics = "${authentication-service.authentication-request-topic-name}")
  public void receive(
      @Payload List<AuthenticationRequestAvroModel> messages,
      @Header(KafkaHeaders.RECEIVED_MESSAGE_KEY) List<String> keys,
      @Header(KafkaHeaders.RECEIVED_PARTITION_ID) List<Integer> partitions,
      @Header(KafkaHeaders.OFFSET) List<Long> offsets) {

    messages.forEach(
        authenticationRequestAvroModel -> {
          AuthenticationRequest request =
              AuthenticationDataMapper.authenticationRequestAvroModelToAuthenticationRequest(
                  authenticationRequestAvroModel);
          messageProcessor.processAuthenticationRequest(request);
        });
  }
}
