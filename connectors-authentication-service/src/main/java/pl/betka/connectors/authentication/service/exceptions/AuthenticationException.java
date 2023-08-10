package pl.betka.connectors.authentication.service.exceptions;

public class AuthenticationException extends RuntimeException {
  public AuthenticationException(String message) {
    super(message);
  }
}
