package com.distribuida.books.clients;

import com.distribuida.books.dtos.AuthorDto;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@Path("/authors")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@RegisterRestClient(configKey = "AuthorRestClient")
public interface AuthorRestClient {

    @GET
    @Path("/{id}")
    AuthorDto findById(@PathParam("id") Integer id);

}
