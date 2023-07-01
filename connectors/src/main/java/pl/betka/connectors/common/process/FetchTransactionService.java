package pl.betka.connectors.common.process;

import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.domain.FetchResponse;

public interface FetchTransactionService extends ConnectorIdentifier {
    FetchResponse fetchTransactions(AuthenticationData authenticationData);
}
