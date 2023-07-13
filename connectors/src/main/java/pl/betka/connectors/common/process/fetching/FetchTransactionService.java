package pl.betka.connectors.common.process.fetching;

import pl.betka.connectors.common.process.ConnectorIdentifier;
import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.connectors.common.domain.fetching.FetchResponse;

public interface FetchTransactionService extends ConnectorIdentifier {
    FetchResponse fetchTransactions(AuthenticationData authenticationData);
}
