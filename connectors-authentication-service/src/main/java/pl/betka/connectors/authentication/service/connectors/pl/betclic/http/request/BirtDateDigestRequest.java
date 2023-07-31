package pl.betka.connectors.authentication.service.connectors.pl.betclic.http.request;

import lombok.Builder;
import lombok.RequiredArgsConstructor;

@Builder
public class BirtDateDigestRequest {
  private final String digestId;
  private final Parameter parameters;

  @RequiredArgsConstructor
  public static class Parameter {
    private final String birthdate;
  }
}
