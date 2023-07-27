package pl.betka.domain.event;

public interface DomainEvent<T> {
  void fire();
}
