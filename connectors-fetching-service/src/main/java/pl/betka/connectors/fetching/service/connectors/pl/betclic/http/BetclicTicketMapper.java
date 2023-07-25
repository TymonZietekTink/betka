package pl.betka.connectors.fetching.service.connectors.pl.betclic.http;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors.fetching.service.common.domain.entity.Bet;
import pl.betka.connectors.fetching.service.common.domain.entity.ComboSelection;
import pl.betka.connectors.fetching.service.common.domain.entity.Ticket;
import pl.betka.connectors.fetching.service.common.process.TicketMapper;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.entity.BetclicBet;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.entity.BetclicComboSelection;
import pl.betka.connectors.fetching.service.connectors.pl.betclic.http.entity.BetclicTicket;

@RequiredArgsConstructor
public class BetclicTicketMapper implements TicketMapper<List<BetclicTicket>> {

  @Override
  public List<Ticket> mapToTickets(List<BetclicTicket> betclicTickets) {
    return betclicTickets.stream().map(this::mapBetclicTicket).collect(Collectors.toList());
  }

  private Ticket mapBetclicTicket(BetclicTicket betclicTicket) {
    Set<Bet> bets =
        betclicTicket.getBetclicBets().stream().map(this::mapToBet).collect(Collectors.toSet());
    return Ticket.builder()
        .ticketType(BetclicMappers.TICKET_TYPE_MAPPER.translate(betclicTicket.getBetType()))
        .betSelections(bets)
        .ticketResult(BetclicMappers.TICKET_RESULT_MAPPER.translate(betclicTicket.getResult()))
        .bookmakerReference(betclicTicket.getExternalId())
        .createdAt(betclicTicket.getBetDate())
        .odds(betclicTicket.getOdds())
        .tax(betclicTicket.getTax())
        .stake(betclicTicket.getStake())
        .build();
  }

  private Bet mapToBet(BetclicBet betclicBet) {

    return Bet.builder()
        .bookmakerReference(String.valueOf(betclicBet.getExternalId()))
        .betSelection(betclicBet.getSelection())
        .eventType(betclicBet.getCompetitionType())
        .category(BetclicMappers.CATEGORY_MAPPER.translate(betclicBet.getCategory()))
        .eventName(betclicBet.getEventName())
        .eventDate(betclicBet.getBetDate())
        .eventStatus(BetclicMappers.EVENT_STATUS_MAPPER.translate(betclicBet.getEventStatus()))
        .betResult(BetclicMappers.BET_RESULT_MAPPER.translate(betclicBet.getResult()))
        .odds(betclicBet.getOdds())
        .selectionType(
            BetclicMappers.SELECTION_TYPE_MAPPER.translate(betclicBet.getSelectionType()))
        .betType(betclicBet.getSelectionLabel())
        .comboSelections(
            hasElements(betclicBet.getComboSelections())
                ? mapToComboSelectionsList(betclicBet)
                : null)
        .build();
  }

  private boolean hasElements(List<BetclicComboSelection> comboSelections) {
    return comboSelections != null && !comboSelections.isEmpty();
  }

  private Set<ComboSelection> mapToComboSelectionsList(BetclicBet betclicBet) {
    List<BetclicComboSelection> comboSelections = betclicBet.getComboSelections();
    return comboSelections.stream().map(this::mapToComboSelection).collect(Collectors.toSet());
  }

  private ComboSelection mapToComboSelection(BetclicComboSelection betclicComboSelection) {
    return ComboSelection.builder()
        .selection(betclicComboSelection.getSelection())
        .bookmakerReference(betclicComboSelection.getBookmakerReference())
        .selectionType(betclicComboSelection.getSelectionType())
        .result(
            BetclicMappers.COMBO_SELECTION_RESULT_MAPPER.translate(
                betclicComboSelection.getResult()))
        .build();
  }
}
