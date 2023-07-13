package pl.betka.connectors.authentication.service.common.utils;

import java.util.UUID;

public class StandardRandomValuesProvider implements RandomValuesProvider {

  @Override
  public UUID generateUUID() {
    return UUID.randomUUID();
  }
}
