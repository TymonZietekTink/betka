package pl.betka.domain.event.publisher;

import pl.betka.domain.event.DomainEvent;

public interface DomainEventPublisher<T extends DomainEvent> {

  void publish(T domainEvent);
}

