package pl.betka.connectors.fetching.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.betka.connectors.fetching.service.common.domain.FetchResult;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchRequest;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchResponse;
import pl.betka.connectors.fetching.service.common.process.FetchTransactionService;
import pl.betka.connectors.fetching.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.fetching.service.service.FetchingService;
import pl.betka.connectors_configuration.FetchingInputData;
import pl.betka.connectors_configuration.pl.betclic.BetclicFetchingInputData;

@RestController
@RequiredArgsConstructor
public class HttpController {
  private final FetchingService fetchingService;
  private final ConnectorsRegistry connectorsRegistry;

  @SneakyThrows
  @PostMapping(path = "/fetch", consumes = MediaType.APPLICATION_JSON_VALUE)
  public void fetchData(@RequestBody FetchRequest fetchRequest){
    FetchTransactionService service = connectorsRegistry.getFetchingService(fetchRequest.getConnectorIdentifier());
    BetclicFetchingInputData inputData = new BetclicFetchingInputData(fetchRequest.getFetchingInputData());
    FetchResult response = service.fetchTransactions(inputData);
    fetchingService.persistTickets(response.getTickets(), fetchRequest.getConnectorIdentifier());
  }

  @SneakyThrows
  @PostMapping(path = "/raport")
  public void generateExcel(){
    fetchingService.generateCsvFiles();
  }
}
