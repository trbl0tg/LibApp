package ua.legendarytec.LibraryApp.domain;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Please fill the book name")
    @Length(max = 255, message = "Text is to long (max length is 255)")
    private String bookName;

    private String bookDetails;

    private String bookAuthor;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User messageAuthor;

    private String publishedIn;
    @Length(max = 255, message = "Tag is to long (max length is 255)")
    private String tag;

    private String filename;

    public Book(){
    }

    public Book(String bookName, String bookAuthor, String publishedIn, String tag, User user) {
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.publishedIn = publishedIn;
        this.tag = tag;
        this.messageAuthor = user;
    }

    public String getMessageAuthorName(){
        return messageAuthor != null ? messageAuthor.getUsername() : "<none>";
    }

    public User getMessageAuthor() {
        return messageAuthor;
    }

    public void setMessageAuthor(User messageAuthor) {
        this.messageAuthor = messageAuthor;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public String getBookDetails() {
        return bookDetails;
    }

    public void setBookDetails(String bookDetails) {
        this.bookDetails = bookDetails;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getPublishedIn() {
        return publishedIn;
    }

    public void setPublishedIn(String publishedIn) {
        this.publishedIn = publishedIn;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

}
