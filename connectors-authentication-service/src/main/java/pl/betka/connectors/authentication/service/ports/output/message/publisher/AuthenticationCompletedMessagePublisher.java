package pl.betka.connectors.authentication.service.ports.output.message.publisher;

import pl.betka.connectors.authentication.service.domain.event.AuthenticationCompletedEvent;
import pl.betka.domain.event.publisher.DomainEventPublisher;

public interface AuthenticationCompletedMessagePublisher extends DomainEventPublisher<AuthenticationCompletedEvent> {}
