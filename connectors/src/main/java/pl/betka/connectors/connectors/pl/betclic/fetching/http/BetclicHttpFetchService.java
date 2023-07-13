package pl.betka.connectors.connectors.pl.betclic.fetching.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.springframework.stereotype.Component;
import pl.betka.connectors.common.domain.fetching.FetchResponse;
import pl.betka.connectors.common.domain.fetching.entity.Ticket;
import pl.betka.connectors.common.process.fetching.FetchTransactionService;
import pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.entity.BetclicTicket;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.response.BetsResponse;
import pl.betka.connectors_configuration.FetchingInputData;
import pl.betka.connectors_configuration.pl.betclic.BetclicFetchingInputData;
import pl.betka.domain.FetchStatus;

@Component
@RequiredArgsConstructor
public class BetclicHttpFetchService implements FetchTransactionService {
  private static final String HOST = "https://betting.begmedia.com/";

  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;
  private final BetclicTicketMapper ticketMapper = new BetclicTicketMapper();

  @Override
  public String getIdentifier() {
    return BetclicConstants.HTTP_IDENTIFIER;
  }

  @SneakyThrows
  @Override
  public FetchResponse fetchTransactions(FetchingInputData fetchingInputData) {
    BetclicFetchingInputData inputData = (BetclicFetchingInputData) fetchingInputData;
    String token = inputData.getToken();

    BetsResponse betsResponse = null;
    List<BetclicTicket> betclicTickets = new ArrayList<>();
    var offset = 0;
    while (isMoreBets(betsResponse)) {
      var url =
          MessageFormat.format(
              "{0}api/v2/me/bets/ended?limit=10&offset={1}&embed=Scoreboard&embed=Metagame",
              HOST, offset);
      var request = buildHttpRequest(url, token);
      var transactionsResponse = httpClient.execute(request, new BasicHttpClientResponseHandler());
      betsResponse = objectMapper.readValue(transactionsResponse, BetsResponse.class);
      betclicTickets.addAll(betsResponse.getBetclicTickets());
      offset += 10;
    }
    List<Ticket> mappedTickets = ticketMapper.mapToTickets(betclicTickets);
    return FetchResponse.builder().fetchStatus(FetchStatus.FETCHED).tickets(mappedTickets).build();
  }

  @SneakyThrows
  private ClassicHttpRequest buildHttpRequest(String url, String token) {
    HttpGet httpGet = new HttpGet(new URI(url));
    httpGet.setHeader("referer", "https://www.betclic.pl/");
    httpGet.setHeader("x-client", token);
    httpGet.setHeader("user-agent", BetclicConstants.USER_AGENT);
    httpGet.setHeader("accept", "application/json, text/plain, */*");
    return httpGet;
  }

  private boolean isMoreBets(BetsResponse betsResponse) {
    if (betsResponse != null && betsResponse.getBetclicTickets().size() != 10) {
      return false;
    }
    return true;
  }
}
