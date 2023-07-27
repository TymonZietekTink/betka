package pl.betka.connectors.fetching.service.common.domain.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;
import lombok.Builder;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.BetId;
import pl.betka.domain.model.valueobject.BetResult;
import pl.betka.domain.model.valueobject.Category;
import pl.betka.domain.model.valueobject.EventStatus;
import pl.betka.domain.model.valueobject.SelectionType;

@SuperBuilder
@Getter
public class Bet extends BaseEntity<BetId> {
  private String bookmakerReference;

  // what has been selected by player
  private String betSelection;

  //  eg. over 2.5 goals
  private String betType;

  // eg. Arsenal - Chelsea
  private String eventName;
  private LocalDate eventDate;
  // eg. Premier League
  private String eventType;
  private EventStatus eventStatus;
  // eg. Football
  private Category category;
  private BigDecimal odds;
  // eg. prematch
  private SelectionType selectionType;
  private BetResult betResult;
  private Set<ComboSelection> comboSelections;
}
