package pl.betka.connectors.connectors.pl.betfan.authentication.http.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class LoginRequest {
    @JsonProperty("login")
    private final String username;

    @JsonProperty("password")
    private final String password;

    @JsonProperty("keepSignedIn")
    private final boolean keepSignedIn = false;
}
