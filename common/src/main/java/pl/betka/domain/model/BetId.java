package pl.betka.domain.model;

import java.util.UUID;

public class BetId extends BaseId<UUID> {

  protected BetId(UUID value) {
    super(value);
  }
}
