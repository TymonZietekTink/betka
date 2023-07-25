package pl.betka.connectors.fetching.service.common.process;

import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors.fetching.service.common.domain.FetchResponse;
import pl.betka.connectors_configuration.FetchingInputData;

public interface FetchTransactionService extends ConnectorIdentifier {
  FetchResponse fetchTransactions(FetchingInputData fetchingInputData);
}
