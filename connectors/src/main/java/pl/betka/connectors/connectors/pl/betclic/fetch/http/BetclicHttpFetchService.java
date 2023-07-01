package pl.betka.connectors.connectors.pl.betclic.fetch.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.net.URI;
import java.text.MessageFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import pl.betka.connectors.ConnectorsConfiguration;
import pl.betka.connectors.common.process.FetchTransactionService;
import pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.entity.Bet;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.response.BetsResponse;
import pl.betka.connectors_configuration.AuthenticationData;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;
import pl.betka.domain.FetchResponse;

@Component
@RequiredArgsConstructor
@Import(ConnectorsConfiguration.class)
public class BetclicHttpFetchService implements FetchTransactionService {
  private final HttpClient httpClient;
  private final ObjectMapper objectMapper;

  @Override
  public String getIdentifier() {
    return BetclicConstants.HTTP_IDENTIFIER;
  }

  @SneakyThrows
  @Override
  public FetchResponse fetchTransactions(AuthenticationData authenticationData) {
    BetclicHttpAuthenticationData inputData = (BetclicHttpAuthenticationData) authenticationData;
    String token = inputData.getToken();

    BetsResponse betsResponse = null;
    List<Bet> bets = new ArrayList<>();
    var offset = 0;
    while (isMoreBets(betsResponse)) {
      var url =
          MessageFormat.format(
              "{0}api/v2/me/bets/ended?limit=10&offset={1}&embed=Scoreboard&embed=Metagame",
              BetclicConstants.HOST_PATH, offset);
      var request = buildHttpRequest(url, token);
      var transactionsResponse = httpClient.execute(request, new BasicHttpClientResponseHandler());
      betsResponse = objectMapper.readValue(transactionsResponse, BetsResponse.class);
      bets.addAll(betsResponse.getBets());
      offset += 10;
      Thread.sleep(1000);
      if (betsResponse.getBets().stream()
          .anyMatch(bet -> bet.getBetDate().isBefore(LocalDate.of(2021, 7, 1)))) {
        break;
      }
    }
    return null;
  }

  @SneakyThrows
  private ClassicHttpRequest buildHttpRequest(String url, String token) {
    token = "{\"auth\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcIklwXCI6XCI4OS42NC44OS4yMDNcIixcIlVzZXJJZFwiOjEzNDM3ODM2LFwiU2Vzc2lvblwiOlwiNDcwMDIxNTkwOVwiLFwiQ291bnRyeUNvZGVcIjpcIlBMXCIsXCJMYW5ndWFnZUNvZGVcIjpcInBhXCIsXCJDdXJyZW5jeUNvZGVcIjpcInBsblwiLFwiSXNBZG1pblwiOmZhbHNlLFwiSXNMb2dnZWRGcm9tQm9cIjpmYWxzZSxcIklzTGF1bmNoZXJcIjpmYWxzZSxcIlJlZ3VsYXRvcklkXCI6NyxcIk5vdEJlZm9yZVwiOlwiMjAyMy0wNy0wMVQwMDowNjo0OC41MjA1NjcyWlwiLFwiRXhwaXJhdGlvblRpbWVcIjpcIjIwMjMtMDctMDFUMDI6MDg6NDguNTIwNTY3MlpcIn0i.5SkzdzI2cGFINbhSKmjSls5FcgWjkP8npP49Z7dAWtk\",\"context\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcIkxlZ2lzbGF0aW9uXCI6XCJQbFwiLFwiU2l0ZVwiOlwiUGxQYVwiLFwiTGFuZ3VhZ2VcIjpcIlBhXCIsXCJDaGFubmVsSWRcIjpcIkJldGNsaWNQbFwiLFwiVW5pdmVyc2VcIjpcIlNwb3J0c1wiLFwiTm90QmVmb3JlXCI6XCIyMDIzLTA3LTAxVDAwOjA2OjQ4LjUyMDU2NzJaXCIsXCJFeHBpcmF0aW9uVGltZVwiOlwiMjAyMy0wNy0wMVQwMjowODo0OC41MjA1NjcyWlwifSI.SKund6BYyEEeVUbOf42jo8LSD89YXuSoagTZVCkacQ8\",\"expiresIn\":7200057}";
    HttpGet httpGet = new HttpGet(new URI(url));
    httpGet.setHeader("referer", "https://www.betclic.pl/");
    httpGet.setHeader("x-client", token);
    httpGet.setHeader(
        "user-agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36");
    httpGet.setHeader("accept", "application/json, text/plain, */*");
    return httpGet;
  }

  private boolean isMoreBets(BetsResponse betsResponse) {
    if (betsResponse != null && betsResponse.getBets().size() != 10) {
      return false;
    }
    return true;
  }
}
