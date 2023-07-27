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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.betka.domain.model.valueobject.TicketResult;
import pl.betka.domain.model.valueobject.TicketType;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tickets")
@Entity
public class TicketEntity {
  @Id private UUID id;
  private String bookmakerReference;
  private LocalDate createdAt;

  @Enumerated(EnumType.STRING)
  private TicketType ticketType;

  @OneToMany(mappedBy = "ticketId", cascade = CascadeType.ALL)
  private Set<BetEntity> betSelections;

  private BigDecimal odds;
  private BigDecimal stake;

  @Enumerated(EnumType.STRING)
  private TicketResult ticketResult;

  private BigDecimal tax;

  private String connectorIdentifier;
}
