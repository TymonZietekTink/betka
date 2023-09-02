package pl.betka.connectors.fetching.service.service;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.List;
import lombok.SneakyThrows;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import pl.betka.connectors.fetching.service.service.entity.ExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ExcelValuesContainer;
import pl.betka.connectors.fetching.service.service.raports.bet.BetRaport;
import pl.betka.connectors.fetching.service.service.raports.bet.BetsCategoryRaport;
import pl.betka.connectors.fetching.service.service.raports.ticket.month.MonthTicketPeriodSummary;
import pl.betka.connectors.fetching.service.service.raports.ticket.month.MonthTicketRaport;
import pl.betka.connectors.fetching.service.service.raports.ticket.month.MonthTicketSummary;

public class ExcelSheet {

  @SneakyThrows
  public static void generateTable(Sheet sheet, List<String> headers, ExcelValuesContainer cellValuesContainer){
    Row headersRow = sheet.createRow(0);
    CellStyle headerStyle = sheet.getWorkbook().createCellStyle();
    headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    for(int i=0; i<headers.size();i++){
      var headerCell = headersRow.createCell(i);
      headerCell.setCellValue(headers.get(i));
    }

    CellStyle style = sheet.getWorkbook().createCellStyle();
    style.setWrapText(true);

    List<ExcelModel> excelModels = cellValuesContainer.getCellValues();
    for (int i=0; i<excelModels.size(); i++){
      Row rowValue = sheet.createRow(i+1);
      ExcelModel model = excelModels.get(i);
      List<String> cellValues = model.generateExcelValues();
      for(int j=0;j<cellValues.size();j++){
        var cell =rowValue.createCell(j);
        cell.setCellValue(cellValues.get(j));
      }
    }
  }


  public static void generateTicketMonthPeriodStatistics(List<MonthTicketRaport> raports, Sheet sheet){
    Integer lastLine = 0;
    for(int i=0;i<raports.size();i++){
      lastLine = generateTicketMonthPeriodStatistic(raports.get(i), sheet, lastLine);
      lastLine = generateTicketMonetPeriodStatisticSummary(raports.get(i).getSummary(), sheet, lastLine);
      lastLine = lastLine +2;
    }
  }

  private static Integer generateTicketMonthPeriodStatistic(MonthTicketRaport monthTicketRaport, Sheet sheet, Integer lastLine) {
    Row row = sheet.createRow(lastLine);
    Cell titleCell = row.createCell(0);
    titleCell.setCellValue(monthTicketRaport.getName());
    lastLine = lastLine+1;
    Row headersRow = sheet.createRow(lastLine);
    Cell monthPeriodCellHeader = headersRow.createCell(0);
    monthPeriodCellHeader.setCellValue("period");
    Cell numberOfBetsCellHeader = headersRow.createCell(1);
    numberOfBetsCellHeader.setCellValue("numberOfBets");
    Cell stakesCellHeader = headersRow.createCell(2);
    stakesCellHeader.setCellValue("stakes");
    Cell moneyOutcomeCellHeader = headersRow.createCell(3);
    moneyOutcomeCellHeader.setCellValue("money_outcome");
    Cell yieldCellHeader = headersRow.createCell(4);
    yieldCellHeader.setCellValue("yield");
    lastLine = lastLine + 1;
    Integer lastRaportLine = 0;
    for(int i=0;i<monthTicketRaport.getMonthPeriodSummaries().size();i++){
      MonthTicketPeriodSummary periodSummary = monthTicketRaport.getMonthPeriodSummaries().get(i);
      Row valueRow = sheet.createRow(lastLine + i);
      Cell monthPeriodCell = valueRow.createCell(0);
      monthPeriodCell.setCellValue(periodSummary.getPeriod().toString());
      Cell numberOfBetsValueCell = valueRow.createCell(1);
      numberOfBetsValueCell.setCellValue(periodSummary.getSummary().getNumberOfTickets());
      Cell stakesValueCell = valueRow.createCell(2);
      stakesValueCell.setCellValue(periodSummary.getSummary().getStakes().toString());
      Cell moneyOutcomeValueCell = valueRow.createCell(3);
      moneyOutcomeValueCell.setCellValue(periodSummary.getSummary().getMoneyOutcome().toString());
      Cell yieldValueCell = valueRow.createCell(4);
      yieldValueCell.setCellValue(periodSummary.getSummary().getYield().toString());
      lastRaportLine = valueRow.getRowNum();
    }
    return lastRaportLine;
  }

  private static Integer generateTicketMonetPeriodStatisticSummary(MonthTicketSummary summary, Sheet sheet, Integer lastLine) {
    lastLine = lastLine + 1;
    Row summaryRow = sheet.createRow(lastLine);
    Cell titleCell = summaryRow.createCell(0);
    titleCell.setCellValue("summary");
    Cell numberOfBetsValueCell = summaryRow.createCell(1);
    numberOfBetsValueCell.setCellValue(summary.getNumberOfTickets());
    Cell stakesValueCell = summaryRow.createCell(2);
    stakesValueCell.setCellValue(summary.getStakes().toString());
    Cell moneyOutcomeValueCell = summaryRow.createCell(3);
    moneyOutcomeValueCell.setCellValue(summary.getMoneyOutcome().toString());
    Cell yieldValueCell = summaryRow.createCell(4);
    yieldValueCell.setCellValue(summary.getYield().toString());
    return summaryRow.getRowNum();
  }

  @SneakyThrows
  public static void writeToFile(String fileName, Workbook workbook){
    File currDir = new File(".");
    String path = currDir.getAbsolutePath();
    String fileLocation = path.substring(0, path.length() - 1) + fileName;

    FileOutputStream outputStream = new FileOutputStream(fileLocation);
    workbook.write(outputStream);
    workbook.close();
  }

  public static void generateOneFailedBetRaport(Sheet sheet, BigDecimal oneFailedBetRatio) {
    Row row = sheet.getRow(0);
    Cell cellTitle = row.createCell(6);
    cellTitle.setCellValue("one_bet_failed_ratio");
    Cell cellValue = row.createCell(7);
    cellValue.setCellValue(oneFailedBetRatio.toString());
  }

  public static void writeBetRaports(List<BetRaport> raports, Sheet sheet) {
    Integer lastLine = 0;
    for(int i=0;i<raports.size();i++){
      lastLine = generateBetStatistic(raports.get(i), sheet, lastLine);
      lastLine = lastLine +2;
    }
  }

  private static Integer generateBetStatistic(BetRaport betRaport, Sheet sheet, Integer lastLine) {
    Row titleRow = sheet.createRow(lastLine);
    Cell titleCell = titleRow.createCell(0);
    titleCell.setCellValue(betRaport.getName());
    lastLine = lastLine +1;
    Row raportHeadersRow = sheet.createRow(lastLine);
    raportHeadersRow.createCell(0).setCellValue("category");
    raportHeadersRow.createCell(1).setCellValue("number_of_bets");
    raportHeadersRow.createCell(2).setCellValue("ratio");
    raportHeadersRow.createCell(3).setCellValue("yield");
    lastLine = lastLine +1;
    Integer raportlastRow = 0;
    for(int i=0; i<betRaport.getCategoryRaports().size();i++){
      BetsCategoryRaport raport = betRaport.getCategoryRaports().stream().toList().get(i);
      Row valuesRow = sheet.createRow(lastLine + i);
      valuesRow.createCell(0).setCellValue(raport.getCategory());
      valuesRow.createCell(1).setCellValue(raport.getNumberOfBets().toString());
      valuesRow.createCell(2).setCellValue(raport.getRatio().toString());
      valuesRow.createCell(3).setCellValue(raport.getYield().toString());
      raportlastRow = valuesRow.getRowNum();
    }
    return raportlastRow;
  }
}
