package pl.betka.connectors.fetching.service.service;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.List;
import lombok.SneakyThrows;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import pl.betka.connectors.fetching.service.service.entity.ExcelModel;
import pl.betka.connectors.fetching.service.service.entity.ExcelValuesContainer;

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

  @SneakyThrows
  public static void writeToFile(String fileName, Workbook workbook){
    File currDir = new File(".");
    String path = currDir.getAbsolutePath();
    String fileLocation = path.substring(0, path.length() - 1) + fileName;

    FileOutputStream outputStream = new FileOutputStream(fileLocation);
    workbook.write(outputStream);
    workbook.close();
  }
}
