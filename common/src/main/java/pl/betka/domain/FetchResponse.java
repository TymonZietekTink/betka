package pl.betka.domain;

import java.util.List;
import lombok.Builder;

@Builder
public class FetchResponse {
  private FetchStatus fetchStatus;
  private List<String> messages;
}
