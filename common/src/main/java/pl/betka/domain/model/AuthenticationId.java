package pl.betka.domain.model;

import java.util.UUID;

public class AuthenticationId extends BaseId<UUID> {
  protected AuthenticationId(UUID value) {
    super(value);
  }
}
