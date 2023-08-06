package pl.betka.connectors.authentication.service.common.domain.event;

import pl.betka.connectors.authentication.service.common.domain.Authentication;
import pl.betka.domain.event.DomainEvent;

public abstract class AuthenticationEvent implements DomainEvent<Authentication> {}
