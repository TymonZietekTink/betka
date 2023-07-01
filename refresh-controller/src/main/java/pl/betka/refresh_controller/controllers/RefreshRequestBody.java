package pl.betka.refresh_controller.controllers;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Map;
import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class RefreshRequestBody {
  private String connectorId;
  private Map<String, String> authData;
}
