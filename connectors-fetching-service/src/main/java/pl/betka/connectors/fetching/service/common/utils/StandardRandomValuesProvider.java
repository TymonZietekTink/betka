package pl.betka.connectors.fetching.service.common.utils;

import java.util.UUID;

public class StandardRandomValuesProvider implements RandomValuesProvider {

  @Override
  public UUID generateUUID() {
    return UUID.randomUUID();
  }
}
