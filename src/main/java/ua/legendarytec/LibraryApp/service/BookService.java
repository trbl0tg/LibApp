package ua.legendarytec.LibraryApp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.legendarytec.LibraryApp.domain.Book;
import ua.legendarytec.LibraryApp.repos.BookRepo;

import java.util.Optional;

@Service
public class BookService {


    @Autowired
    BookRepo bookRepo;

    public void deleteBookById(Long bookId){
        bookRepo.deleteById(bookId);
    }
}
