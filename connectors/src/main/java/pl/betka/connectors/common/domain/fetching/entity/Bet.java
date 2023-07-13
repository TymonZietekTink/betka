package pl.betka.connectors.common.domain.fetching.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import lombok.Builder;
import pl.betka.connectors.common.domain.fetching.valueobject.Category;
import pl.betka.connectors.common.domain.fetching.valueobject.EventStatus;
import pl.betka.connectors.common.domain.fetching.valueobject.BetResult;
import pl.betka.connectors.common.domain.fetching.valueobject.SelectionType;
import pl.betka.domain.model.BaseEntity;
import pl.betka.domain.model.BetId;

@Builder
public class Bet extends BaseEntity<BetId> {
  // what has been selected by player
  private String betSelection;

  //  eg. over 2.5 goals
  private String betType;

  // eg. Arenal - Chelsea
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



}