package pl.betka.connectors.connectors.pl.betclic.http;

import pl.betka.connectors.common.domain.fetching.valueobject.BetResult;
import pl.betka.connectors.common.domain.fetching.valueobject.Category;
import pl.betka.connectors.common.domain.fetching.valueobject.EventStatus;
import pl.betka.connectors.common.domain.fetching.valueobject.SelectionType;
import pl.betka.connectors.common.domain.fetching.valueobject.TicketResult;
import pl.betka.connectors.common.domain.fetching.valueobject.TicketType;
import pl.betka.connectors.common.utils.TypeMapper;

public class BetclicMappers {
  static final TypeMapper<BetResult> BET_RESULT_MAPPER =
      TypeMapper.<BetResult>builder()
          .put(BetResult.PENDING, "NotSet")
          .put(BetResult.LOSE, "Lose")
          .put(BetResult.WIN, "Win")
          .setDefaultTranslationValue(BetResult.OTHER)
          .build();

  static final TypeMapper<Category> CATEGORY_MAPPER =
      TypeMapper.<Category>builder()
          .put(Category.FOOTBALL, "Piłka nożna")
          .put(Category.BASKETBALL, "Koszykówka")
          .put(Category.MOTORSPORT, "Żużel")
          .put(Category.TENNIS, "Tenis")
          .setDefaultTranslationValue(Category.OTHER.OTHER)
          .build();

  static final TypeMapper<EventStatus> EVENT_STATUS_MAPPER =
      TypeMapper.<EventStatus>builder()
          .put(EventStatus.LIVE, "live")
          .put(EventStatus.NOT_STARTED, "prematch")
          .put(EventStatus.ENDED, "ended")
          .setDefaultTranslationValue(EventStatus.OTHER)
          .build();

  static final TypeMapper<SelectionType> SELECTION_TYPE_MAPPER =
      TypeMapper.<SelectionType>builder()
          .put(SelectionType.LIVE, "live")
          .put(SelectionType.PREMATCH, "prematch")
          .setDefaultTranslationValue(SelectionType.OTHER)
          .build();

  static final TypeMapper<TicketResult> TICKET_RESULT_MAPPER =
      TypeMapper.<TicketResult>builder()
          .put(TicketResult.PENDING, "NotSet")
          .put(TicketResult.LOSE, "Lose")
          .put(TicketResult.WIN, "Win")
          .setDefaultTranslationValue(TicketResult.OTHER)
          .build();

  static final TypeMapper<TicketType> TICKET_TYPE_MAPPER =
      TypeMapper.<TicketType>builder()
          .put(TicketType.SINGLE, "simple")
          .put(TicketType.MULTIPLE, "multiple")
          .setDefaultTranslationValue(TicketType.OTHER)
          .build();
}
