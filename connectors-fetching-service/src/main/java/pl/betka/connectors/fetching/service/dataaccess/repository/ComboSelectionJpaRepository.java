package pl.betka.connectors.fetching.service.dataaccess.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.betka.connectors.fetching.service.common.domain.entity.ComboSelection;

@Repository
public interface ComboSelectionJpaRepository extends JpaRepository<ComboSelection, UUID> {}
