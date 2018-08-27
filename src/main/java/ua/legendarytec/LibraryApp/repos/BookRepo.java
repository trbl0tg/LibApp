package ua.legendarytec.LibraryApp.repos;

import org.springframework.data.repository.CrudRepository;
import ua.legendarytec.LibraryApp.domain.Book;

import java.util.List;
import java.util.Optional;

public interface BookRepo extends CrudRepository<Book, Long> {

    List<Book> findByTag(String tag);
    Optional<Book> findById(Long bookId);
}
