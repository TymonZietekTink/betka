package pl.betka.connectors.connectors.pl.betclic.fetch.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.text.MessageFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.BasicHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpRequest;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import pl.betka.connectors.ConnectorsConfiguration;
import pl.betka.connectors.common.process.FetchTransactionService;
import pl.betka.connectors.connectors.pl.betclic.common.BetclicConstants;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.entity.Bet;
import pl.betka.connectors.connectors.pl.betclic.fetch.http.entity.BetSelection;
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
  private final String host;

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
              host, offset);
      var request = buildHttpRequest(url, token);
      var transactionsResponse = httpClient.execute(request, new BasicHttpClientResponseHandler());
      System.out.println(transactionsResponse);
      betsResponse = objectMapper.readValue(transactionsResponse, BetsResponse.class);
      bets.addAll(betsResponse.getBets());
      offset += 10;
      Thread.sleep(1000);
      if (betsResponse.getBets().stream()
          .anyMatch(bet -> bet.getBetDate().isBefore(LocalDate.of(2021, 7, 1)))) {
        break;
      }
    }
    createExcel(bets);
    return null;
  }

  @SneakyThrows
  public void createExcel(List<Bet> betsResponse) {
    Workbook workbook = new HSSFWorkbook();
    Sheet betSheet = workbook.createSheet("Bets");
    createBetHeaders(workbook, betSheet);
    createBetContent(betsResponse, workbook, betSheet);

    Sheet betSelectionSheet = workbook.createSheet("Bet_Selections");
    createBetSelectionsHeaders(workbook, betSelectionSheet);
    Integer counter = 1;
    Set<BetSelection> betSelections = new HashSet<>();
    betsResponse.forEach(bet -> bet.getBetSelections().forEach(betSelections::add));
    createBetSelectionsContent(betSelections, workbook, betSelectionSheet, counter);
    File currDir = new File(".");
    String path = currDir.getAbsolutePath();
    String fileLocation = path.substring(0, path.length() - 1) + "temp.xls";
    FileOutputStream outputStream = new FileOutputStream(fileLocation);
    workbook.write(outputStream);
    workbook.close();
  }

  private Integer createBetSelectionsContent(Set<BetSelection> bet, Workbook workbook, Sheet betSheet, Integer counter) {
    for (int i = 0; i < bet.size(); i++) {
      BetSelection betSelection = new ArrayList<>(bet).get(i);
      Row row = betSheet.createRow(counter);
      Cell cell = row.createCell(0);
      cell.setCellValue(betSelection.getSelection());
      cell = row.createCell(1);
      cell.setCellValue(betSelection.getSelectionLabel());
      cell = row.createCell(2);
      cell.setCellValue(betSelection.getEventTitle());
      cell = row.createCell(3);
      cell.setCellValue(betSelection.getBetDate());
      cell = row.createCell(4);
      cell.setCellValue(betSelection.getCompetitionType());
      cell = row.createCell(5);
      cell.setCellValue(betSelection.getResult());
      cell = row.createCell(6);
      cell.setCellValue(betSelection.getOdds().doubleValue());
      cell = row.createCell(7);
      cell.setCellValue(betSelection.getEventType());
      counter++;
    }
    return counter;
  }

  private void createBetSelectionsHeaders(Workbook workbook, Sheet betSheet) {
    Row header = betSheet.createRow(0);
    CellStyle headerStyle = workbook.createCellStyle();
    headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    HSSFFont font = (HSSFFont) workbook.createFont();
    font.setFontName("Arial");
    font.setFontHeightInPoints((short) 16);
    font.setBold(true);
    headerStyle.setFont(font);

    Cell headerCell = header.createCell(0);
    headerCell.setCellValue("Typ");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(1);
    headerCell.setCellValue("Kategoria Typu");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(2);
    headerCell.setCellValue("Event");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(3);
    headerCell.setCellValue("Data");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(4);
    headerCell.setCellValue("Konkurencja");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(5);
    headerCell.setCellValue("Rezultat");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(6);
    headerCell.setCellValue("Kurs");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(7);
    headerCell.setCellValue("Sport");
    headerCell.setCellStyle(headerStyle);
  }

  private void createBetContent(List<Bet> bets, Workbook workbook, Sheet sheet) {
    for (int i = 0; i < bets.size(); i++) {
      Bet bet = bets.get(i);
      Row row = sheet.createRow(i+1);
      Cell cell = row.createCell(0);
      cell.setCellValue(bet.getBetType());
      cell = row.createCell(1);
      cell.setCellValue(bet.getBetDate());
      cell = row.createCell(2);
      cell.setCellValue(bet.getResult());
      cell = row.createCell(3);
      cell.setCellValue(bet.getOdds().doubleValue());
      cell = row.createCell(4);
      cell.setCellValue(bet.getStake().doubleValue());
      cell = row.createCell(5);
      cell.setCellValue(bet.getWin().doubleValue());
      cell = row.createCell(6);
      cell.setCellValue(
          bet.getResult().equals("Lose")
              ? bet.getStake().negate().doubleValue()
              : bet.getWin().doubleValue());
      cell = row.createCell(7);
      cell.setCellValue(bet.getBetSelections().size());
    }
  }

  private void createBetHeaders(Workbook workbook, Sheet sheet) {
    Row header = sheet.createRow(0);
    CellStyle headerStyle = workbook.createCellStyle();
    headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    HSSFFont font = (HSSFFont) workbook.createFont();
    font.setFontName("Arial");
    font.setFontHeightInPoints((short) 16);
    font.setBold(true);
    headerStyle.setFont(font);

    Cell headerCell = header.createCell(0);
    headerCell.setCellValue("Typ Beta");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(1);
    headerCell.setCellValue("Data");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(2);
    headerCell.setCellValue("Rezultat");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(3);
    headerCell.setCellValue("Kurs");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(4);
    headerCell.setCellValue("Stawka");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(5);
    headerCell.setCellValue("Potencjalna wygrana");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(6);
    headerCell.setCellValue("Ostateczny bilans");
    headerCell.setCellStyle(headerStyle);
    headerCell = header.createCell(7);
    headerCell.setCellValue("ilosc na kuponie");
    headerCell.setCellStyle(headerStyle);
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
