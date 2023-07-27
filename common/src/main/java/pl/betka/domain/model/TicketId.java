package pl.betka.domain.model;

import java.util.UUID;

public class TicketId extends BaseId<UUID> {

  public TicketId(UUID value) {
    super(value);
  }
}
