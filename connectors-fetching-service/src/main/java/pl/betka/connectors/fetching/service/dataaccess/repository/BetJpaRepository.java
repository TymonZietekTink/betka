package pl.betka.connectors.fetching.service.dataaccess.repository;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;

@Repository
public interface BetJpaRepository extends JpaRepository<BetEntity, UUID> {
  @Query(
      value = "SELECT MAX(event_date) FROM bets",
      nativeQuery = true)
  Optional<LocalDate> getMaxDateBetInStorage();
}
