package pl.betka.domain.model;

import java.util.UUID;

public class AuthenticationId extends BaseId<UUID> {
  public AuthenticationId(UUID value) {
    super(value);
  }
}
