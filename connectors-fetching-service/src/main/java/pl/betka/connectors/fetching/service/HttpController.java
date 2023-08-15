package pl.betka.connectors.fetching.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.betka.connectors.common.utils.RandomValuesProvider;
import pl.betka.connectors.common.utils.StandardRandomValuesProvider;
import pl.betka.connectors.fetching.service.common.domain.FetchResult;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchRequest;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchResponse;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.common.process.FetchTransactionService;
import pl.betka.connectors.fetching.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.BetclicTicketMapper;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.response.BetsResponse;
import pl.betka.connectors.fetching.service.service.FetchingService;
import pl.betka.connectors_configuration.FetchingInputData;
import pl.betka.connectors_configuration.pl.betclic.BetclicFetchingInputData;

@RestController
@RequiredArgsConstructor
public class HttpController {
  private final FetchingService fetchingService;
  private final ObjectMapper objectMapper;
  private final ConnectorsRegistry connectorsRegistry;

  @Value("classpath:bets_history.json")
  Resource resourceFile;

  @SneakyThrows
  @PostMapping(path = "/fetch", consumes = MediaType.APPLICATION_JSON_VALUE)
  public void fetchData(@RequestBody FetchRequest fetchRequest){
//    FetchTransactionService service = connectorsRegistry.getFetchingService(fetchRequest.getConnectorIdentifier());
//    BetclicFetchingInputData inputData = new BetclicFetchingInputData(fetchRequest.getFetchingInputData());
//    FetchResult response = service.fetchTransactions(inputData);
    File file = resourceFile.getFile();
    FileInputStream inputStream = new FileInputStream(file);
    String serializedJson = new String(inputStream.readAllBytes());
    BetsResponse betsResponse = objectMapper.readValue(serializedJson, BetsResponse.class);
    BetclicTicketMapper ticketMapper = new BetclicTicketMapper(new StandardRandomValuesProvider());
    List<Ticket> tickets = ticketMapper.mapToTickets(betsResponse.getBetclicTickets());
    fetchingService.persistTickets(tickets, fetchRequest.getConnectorIdentifier());
  }
}
