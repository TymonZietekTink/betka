package pl.betka.domain.model;

import java.util.UUID;

public class BetId extends BaseId<UUID> {

  public BetId(UUID value) {
    super(value);
  }
}
