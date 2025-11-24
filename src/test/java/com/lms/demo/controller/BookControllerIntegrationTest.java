package com.lms.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lms.demo.data.model.Book;
import com.lms.demo.data.repository.BookRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
public class BookControllerIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private BookRepository bookRepository;

    @Before
    public void setup() {
        bookRepository.deleteAll();
    }

    @Test
    public void addBooks_rejectsInvalidPayload() throws Exception {
        Book invalid = new Book();
        invalid.setIsbn("123");
        invalid.setTitle("Go");
        invalid.setPages(0);
        invalid.setAvailable(-1);

        mockMvc.perform(post("/api/addBook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsBytes(Collections.singletonList(invalid))))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").exists());

        assertThat(bookRepository.count()).isZero();
    }

    @Test
    public void addBooks_acceptsValidPayloadAndPersists() throws Exception {
        Book valid = new Book();
        valid.setIsbn("9780134685991");
        valid.setTitle("Effective Java");
        valid.setPages(416);
        valid.setAvailable(3);

        mockMvc.perform(post("/api/addBook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsBytes(Collections.singletonList(valid))))
                .andExpect(status().isOk());

        assertThat(bookRepository.count()).isEqualTo(1);

        mockMvc.perform(get("/api/getBooks"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].isbn").value("9780134685991"));
    }
}
