package pl.betka.connectors.fetching.service.dataaccess.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.betka.connectors.fetching.service.dataaccess.entity.BetEntity;

@Repository
public interface BetJpaRepository extends JpaRepository<BetEntity, UUID> {}
