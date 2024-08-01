package com.distribuida.books.repository;

import com.distribuida.books.db.Book;

import java.util.List;

public interface BookRepository {

    List<Book> findAll();

    Book findById(Integer id);

    void persist(Book book);

    void update(Book book);

    void delete(Integer id);

}
