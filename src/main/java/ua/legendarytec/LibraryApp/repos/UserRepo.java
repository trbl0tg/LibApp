package ua.legendarytec.LibraryApp.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.legendarytec.LibraryApp.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
