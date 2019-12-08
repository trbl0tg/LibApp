package ua.legendarytec.LibraryApp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.legendarytec.LibraryApp.repos.MedicineRepo;

@Service
public class BookService {


    @Autowired
    MedicineRepo medicineRepo;

    public void deleteBookById(Long bookId){
        medicineRepo.deleteById(bookId);
    }
}
