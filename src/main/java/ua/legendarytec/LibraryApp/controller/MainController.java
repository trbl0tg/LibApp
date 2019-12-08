package ua.legendarytec.apteka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ua.legendarytec.apteka.domain.Book;
import ua.legendarytec.apteka.domain.User;
import ua.legendarytec.apteka.repos.BookRepo;
import ua.legendarytec.apteka.service.BookService;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class  MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private BookRepo bookRepo;

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public String greeting(@AuthenticationPrincipal User user, Model model){
        if (user!=null){
            return "greeting";
        }
        return   "redirect:/login";
    }


    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "")String filter, Model model){
        Iterable<Book> books =  bookRepo.findAll();

        if (filter!=null && !filter.isEmpty()){
            books = bookRepo.findByTag(filter);
        } else
        {
            books = bookRepo.findAll();
        }


        model.addAttribute("books", books);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(

            @AuthenticationPrincipal User user,
            @Valid Book book,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
           ) throws IOException {
       book.setMessageAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("book", book);

       }    else {
            saveFile(book, file);

            model.addAttribute("book", null);
           bookRepo.save(book);

       }

        Iterable<Book> books =  bookRepo.findAll();

        model.addAttribute("books", books);

        return "main";
    }

    private void saveFile(@Valid Book book, @RequestParam("file") MultipartFile file) throws IOException {
        if (file!= null && !file.getOriginalFilename().isEmpty()){

            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidfile = UUID.randomUUID().toString();
            String resoultFilename = uuidfile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath +"/"+ resoultFilename));

            book.setFilename(resoultFilename);
        }
    }

    @GetMapping("/user-books/{user}")
    public String userBooks(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            Model model,
            @RequestParam(required = false) Book book
    ){

        Set<Book> books = user.getBooks();

        model.addAttribute("books", books);
        model.addAttribute("book", book);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "userBooks";
    }

    @PostMapping("/user-books/{user}")
    public String updateBook(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam Book book,
            @RequestParam("bookName") String bookName,
            @RequestParam("bookDetails") String bookDetails,
            @RequestParam("bookAuthor") String bookAuthor,
            @RequestParam("publishedIn") String publishedIn,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file

    ) throws IOException {
        if(book.getMessageAuthor().equals(currentUser)){

            if(!StringUtils.isEmpty(bookName)) {
                book.setBookName(bookName);
            }
            if(!StringUtils.isEmpty(bookDetails)) {
                book.setBookDetails(bookDetails);
            }
            if(!StringUtils.isEmpty(bookAuthor)) {
                book.setBookAuthor(bookAuthor);
            }
            if(!StringUtils.isEmpty(publishedIn)) {
                book.setPublishedIn(publishedIn);
            }
            if(!StringUtils.isEmpty(tag)) {
                book.setTag(tag);
            }

            saveFile(book,file);
            bookRepo.save(book);

        }



        return "redirect:/user-books/"+user;
    }

    @GetMapping("/user-books/delete/{user}")
    public String deleteMessage(
            @RequestParam(required = false) Book book
    ){
        bookRepo.deleteById(book.getId());
         return "redirect:/main";
    }


}