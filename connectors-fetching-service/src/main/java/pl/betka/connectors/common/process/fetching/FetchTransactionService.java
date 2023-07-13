package pl.betka.connectors.common.process.fetching;

import pl.betka.connectors.common.domain.fetching.FetchResponse;
import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.FetchingInputData;

public interface FetchTransactionService extends ConnectorIdentifier {
    FetchResponse fetchTransactions(FetchingInputData fetchingInputData);
}
