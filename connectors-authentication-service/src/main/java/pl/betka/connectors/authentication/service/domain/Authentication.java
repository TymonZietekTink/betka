package pl.betka.connectors.authentication.service.domain;

import java.time.LocalDate;
import java.util.UUID;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.domain.AuthenticationStatus;
import pl.betka.domain.model.AggregateRoot;
import pl.betka.domain.model.AuthenticationId;

@SuperBuilder
@Getter
public class Authentication extends AggregateRoot<AuthenticationId> {
  private final AuthenticationId authenticationId;
  private final AuthenticationStatus status;
  private final String bookmakerIdentifier;
  private final UUID userId;
  private final UserInfo userInfo;
}
