package pl.betka.connectors.authentication.service.domain.event;

import pl.betka.connectors.authentication.service.domain.model.Authentication;
import pl.betka.domain.event.publisher.DomainEventPublisher;

public class AuthenticationCompletedEvent extends AuthenticationEvent {
  private final DomainEventPublisher<AuthenticationCompletedEvent> publisher;

  public AuthenticationCompletedEvent(
      Authentication authentication,
      DomainEventPublisher<AuthenticationCompletedEvent> eventPublisher) {
    super(authentication);
    this.publisher = eventPublisher;
  }

  @Override
  public void fire() {
    publisher.publish(this);
  }
}
