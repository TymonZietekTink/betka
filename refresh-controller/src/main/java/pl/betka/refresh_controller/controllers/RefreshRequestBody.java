package pl.betka.refresh_controller.controllers;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Map;
import java.util.UUID;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class RefreshRequestBody {
  private UUID authId;
  private String connectorId;
  private UUID userId;
  private String authData;
}
