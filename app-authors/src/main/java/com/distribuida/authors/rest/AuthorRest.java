package com.distribuida.authors.rest;


import com.distribuida.authors.db.Author;
import com.distribuida.authors.repo.AuthorRepository;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;

@Path("/authors")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class AuthorRest {

    @Inject
    private AuthorRepository repo;

    @GET
    public List<Author> findAll() {
        return repo.findAll();
    }

    @GET
    @Path("/{id}")
    public Response findById(@PathParam("id") Integer id) {
        Author author = repo.findById(id);
        if (author == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(author).build();
    }

    @POST
    public Response create(Author author) {
        repo.persist(author);
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("/{id}")
    public Response update(Author author, @PathParam("id") Integer id) {
        Author existingAuthor = repo.findById(id);
        if (existingAuthor == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        existingAuthor.setFirstName(author.getFirstName());
        existingAuthor.setLastName(author.getLastName());
        repo.update(existingAuthor);
        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}")
    public Response delete(@PathParam("id") Integer id) {
        repo.delete(id);
        return Response.ok().build();
    }
}
