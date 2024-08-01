package com.distribuida.books.rest;


import com.distribuida.books.clients.AuthorRestClient;
import com.distribuida.books.db.Book;
import com.distribuida.books.dtos.BookDto;
import com.distribuida.books.repository.BookRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.eclipse.microprofile.rest.client.inject.RestClient;

import java.util.List;

@Path("/books")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@ApplicationScoped
@Transactional
public class BookRest {

    @Inject
    BookRepository br;

    @Inject
    @RestClient
    AuthorRestClient authorRestClient;


    @GET
    public List<BookDto> findAll() {
        System.out.println("findAll books");
        var books = br.findAll();

        return books.stream()
                .map(book -> {
                    try {
                        var author = authorRestClient.findById(book.getAuthorId());
                        BookDto dto = new BookDto();

                        dto.setId(book.getId());
                        dto.setTitle(book.getTitle());
                        dto.setIsbn(book.getIsbn());
                        dto.setPrice(book.getPrice());
                        dto.setAuthorName(author.getFirstName());

                        return dto;
                    } catch (Exception e) {
                        System.err.println("Error fetching author: " + e.getMessage());
                        BookDto dto = new BookDto();
                        dto.setId(book.getId());
                        dto.setTitle(book.getTitle());
                        dto.setIsbn(book.getIsbn());
                        dto.setPrice(book.getPrice());
                        dto.setAuthorName("Unknown");

                        return dto;
                    }
                }).toList();
    }

    @GET
    @Path("/{id}")
    public Response findById(@PathParam("id") Integer id) {
        Book book = br.findById(id);
        if (book == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(book).build();
    }

    @POST
    public Response create(Book book) {
        br.persist(book);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("/{id}")
    public Response update(@PathParam("id") Integer id, Book book) {
        Book obj = br.findById(id);
        if (obj == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        obj.setIsbn(book.getIsbn());
        obj.setTitle(book.getTitle());
        obj.setPrice(book.getPrice());
        obj.setAuthorId(book.getAuthorId());
        br.update(obj);
        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}")
    public Response delete(@PathParam("id") Integer id) {
        Book obj = br.findById(id);
        if (obj != null) {
            br.delete(id);
            return Response.noContent().build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Book not found")
                    .build();
        }
    }


}
