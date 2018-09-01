package ua.legendarytec.LibraryApp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import ua.legendarytec.LibraryApp.controller.MainController;

import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@WithUserDetails("admin")
@TestPropertySource("/application-test.properties")
@Sql(value = {"/create-user-before.sql", "/book-list-before.sql"}, executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
@Sql(value = {"/book-list-after.sql" ,"/create-user-after.sql"}, executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
public class MainControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private MainController controller;

    @Test
    public void mainPageTest() throws Exception{
    this.mockMvc.perform(get("/main"))
            .andDo(print())
            .andExpect(authenticated())
            .andExpect(xpath("//*[@id='navbarSupportedContent']/div").string("admin"));

    }

    @Test
    public void bookListTest() throws Exception{
        this.mockMvc.perform(get("/main"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//tbody[@id='books-list']/tr").nodeCount(2));
    }

    @Test
    public void filterTest() throws Exception{
        this.mockMvc.perform(get("/main").param("filter","1"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//tbody[@id='books-list']/tr").nodeCount(1))
                .andExpect(xpath("//tbody[@id='books-list']/tr[@data-id='1']").exists());

        this.mockMvc.perform(get("/main").param("filter","2"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//tbody[@id='books-list']/tr").nodeCount(1))
                .andExpect(xpath("//tbody[@id='books-list']/tr[@data-id='2']").exists());

    }

    @Test
    public void addBookToListTest() throws Exception{
        MockHttpServletRequestBuilder multipart = multipart("/main")
                .file("file", "123".getBytes())
                .param("bookName","multipartTest")
                .param("tag", "multipartTest")
                .with(SecurityMockMvcRequestPostProcessors.csrf());

        this.mockMvc.perform(multipart)
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//tbody[@id='books-list']/tr").nodeCount(3))
                .andExpect(xpath("//tbody[@id='books-list']/tr/td/h5").string("multipartTest"));

    }
}
