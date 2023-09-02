package pl.betka.connectors.fetching.service;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import pl.betka.connectors.fetching.service.common.domain.FetchResult;
import pl.betka.connectors.fetching.service.common.domain.dto.FetchRequest;
import pl.betka.connectors.fetching.service.common.process.FetchTransactionService;
import pl.betka.connectors.fetching.service.connectors.ConnectorsRegistry;
import pl.betka.connectors.fetching.service.service.ExcelService;
import pl.betka.connectors.fetching.service.service.FetchingService;
import pl.betka.connectors_configuration.pl.betclic.BetclicFetchingInputData;

@RestController
@RequiredArgsConstructor
public class HttpController {
  private final FetchingService fetchingService;
  private final ExcelService excelService;
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
    excelService.generateRaport();
  }
}
