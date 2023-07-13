package pl.betka.connectors_configuration.pl.betclic;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors_configuration.FetchingInputData;

@Getter
@AllArgsConstructor
public class BetclicFetchingInputData implements FetchingInputData {
  private String token;
}
