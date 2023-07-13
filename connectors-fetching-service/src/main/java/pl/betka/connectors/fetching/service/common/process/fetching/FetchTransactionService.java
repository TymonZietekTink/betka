package pl.betka.connectors.fetching.service.common.process.fetching;

import pl.betka.connectors.fetching.service.common.domain.fetching.FetchResponse;
import pl.betka.connectors.fetching.service.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.FetchingInputData;

public interface FetchTransactionService extends ConnectorIdentifier {
    FetchResponse fetchTransactions(FetchingInputData fetchingInputData);
}
