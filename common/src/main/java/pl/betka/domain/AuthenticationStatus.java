package pl.betka.domain;

public enum AuthenticationStatus {
  STARTED,
  AUTHENTICATING,
  AUTHENTICATED,
  FAILED,
  NEEDS_ADDITIONAL_INPUT
}
