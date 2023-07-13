package pl.betka.connectors.common.integration;

import java.util.UUID;
import pl.betka.connectors.common.utils.RandomValuesProvider;

public class FakeRandomValuesProvider implements RandomValuesProvider {

  @Override
  public UUID generateUUID() {
    return UUID.fromString("d38611dd-f45d-4ff3-884a-353683918438");
  }
}
