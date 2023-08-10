package pl.betka.connectors.authentication.service.domain.model;

import java.time.LocalDate;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import pl.betka.domain.AuthenticationStatus;
import pl.betka.domain.model.AggregateRoot;
import pl.betka.domain.model.AuthenticationId;

@SuperBuilder
@Getter
@Setter
public class Authentication extends AggregateRoot<AuthenticationId> {
  private final AuthenticationId authenticationId;
  private final String bookmakerIdentifier;
  private final String serializedUserInfo;
  private final LocalDate lastRefreshDate;
  private AuthenticationStatus status;
  private List<String> failureMessages;
  private String serializedAuthOutput;
}
