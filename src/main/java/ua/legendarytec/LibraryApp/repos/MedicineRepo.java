package ua.legendarytec.LibraryApp.repos;

import org.springframework.data.repository.CrudRepository;
import ua.legendarytec.LibraryApp.domain.Medicine;

import java.util.List;
import java.util.Optional;

public interface BookRepo extends CrudRepository<Medicine, Long> {

    List<Medicine> findByTag(String tag);
    Optional<Medicine> findById(Long bookId);
}
