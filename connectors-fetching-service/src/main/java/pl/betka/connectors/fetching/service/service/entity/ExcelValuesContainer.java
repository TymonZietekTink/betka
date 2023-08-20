package pl.betka.connectors.fetching.service.service.entity;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;

public class ExcelValuesContainer {
  private List<ExcelModel> models = new ArrayList<>();

  public List<ExcelModel> getCellValues(){
    return models;
  }

  public void add(ExcelModel model){
    models.add(model);
  }

  public void clear(){
    models = new ArrayList<>();
  }
}
