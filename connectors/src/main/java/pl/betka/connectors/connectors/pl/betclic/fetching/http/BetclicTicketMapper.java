package pl.betka.connectors.connectors.pl.betclic.fetching.http;

import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.BET_RESULT_MAPPER;
import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.CATEGORY_MAPPER;
import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.EVENT_STATUS_MAPPER;
import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.SELECTION_TYPE_MAPPER;
import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.TICKET_RESULT_MAPPER;
import static pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicMappers.TICKET_TYPE_MAPPER;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.stream.Collectors;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import pl.betka.connectors.common.domain.fetching.entity.Bet;
import pl.betka.connectors.common.domain.fetching.entity.Ticket;
import pl.betka.connectors.common.process.fetching.TicketMapper;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.entity.BetclicBet;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.entity.BetclicTicket;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.response.BetsResponse;

@RequiredArgsConstructor
public class BetclicTicketMapper implements TicketMapper<List<BetclicTicket>> {

  @Override
  public List<Ticket> mapToTickets(List<BetclicTicket> betclicTickets) {
    return betclicTickets.stream()
        .map(this::mapBetclicTicket)
        .collect(Collectors.toList());
  }

  private Ticket mapBetclicTicket(BetclicTicket betclicTicket) {
    List<Bet> bets =
        betclicTicket.getBetclicBets().stream().map(this::mapToBet).collect(Collectors.toList());
    return Ticket.builder()
        .ticketType(TICKET_TYPE_MAPPER.translate(betclicTicket.getBetType()))
        .betSelections(bets)
        .betResult(TICKET_RESULT_MAPPER.translate(betclicTicket.getResult()))
        .bookmakerReference(betclicTicket.getExternalId())
        .createdAt(betclicTicket.getBetDate())
        .odds(betclicTicket.getOdds())
        .tax(betclicTicket.getTax())
        .stake(betclicTicket.getStake())
        .build();
  }

  private Bet mapToBet(BetclicBet betclicBet) {
    return Bet.builder()
        .betSelection(betclicBet.getSelection())
        .eventType(betclicBet.getCompetitionType())
        .category(CATEGORY_MAPPER.translate(betclicBet.getCategory()))
        .eventName(betclicBet.getEventName())
        .eventDate(betclicBet.getBetDate())
        .eventStatus(EVENT_STATUS_MAPPER.translate(betclicBet.getEventStatus()))
        .betResult(BET_RESULT_MAPPER.translate(betclicBet.getResult()))
        .odds(betclicBet.getOdds())
        .selectionType(SELECTION_TYPE_MAPPER.translate(betclicBet.getSelectionType()))
        .betType(betclicBet.getSelectionLabel())
        .build();
  }
}
