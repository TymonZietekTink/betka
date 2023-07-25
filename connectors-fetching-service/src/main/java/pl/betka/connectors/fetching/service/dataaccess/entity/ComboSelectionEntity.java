package pl.betka.connectors.fetching.service.dataaccess.entity;

import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.betka.connectors.fetching.service.common.domain.valueobject.ComboSelectionResult;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "combo_selections")
@Entity
public class ComboSelectionEntity {
  @Id private UUID id;
  private String bookmakerReference;
  private String selection;
  private String selectionType;

  @Enumerated(EnumType.STRING)
  private ComboSelectionResult result;

  @ManyToOne
  @JoinColumn(name = "bet_id", nullable = false)
  private BetEntity betId;
}
