package pl.betka.connectors.fetching.service.dataaccess.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Set;
import java.util.UUID;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.betka.connectors.fetching.service.common.domain.valueobject.BetResult;
import pl.betka.connectors.fetching.service.common.domain.valueobject.Category;
import pl.betka.connectors.fetching.service.common.domain.valueobject.EventStatus;
import pl.betka.connectors.fetching.service.common.domain.valueobject.SelectionType;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "bets")
@Entity
public class BetEntity {
  @Id private UUID id;
  private String bookmakerReference;
  private String betSelection;
  private String betType;
  private String eventName;
  private LocalDate eventDate;
  private String eventType;

  @Enumerated(EnumType.STRING)
  private EventStatus eventStatus;

  @Enumerated(EnumType.STRING)
  private Category category;

  private BigDecimal odds;

  @Enumerated(EnumType.STRING)
  private SelectionType selectionType;

  private BetResult betResult;

  @OneToMany(mappedBy = "betId", cascade = CascadeType.ALL)
  private Set<ComboSelectionEntity> comboSelections;

  @ManyToOne
  @JoinColumn(name = "ticket_id", nullable = false)
  private TicketEntity ticketId;
}
