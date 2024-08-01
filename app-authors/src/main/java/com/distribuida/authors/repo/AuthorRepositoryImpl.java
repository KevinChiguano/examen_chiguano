package com.distribuida.authors.repo;

import com.distribuida.authors.db.Author;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.util.List;

@ApplicationScoped
@Transactional
public class AuthorRepositoryImpl implements AuthorRepository{

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Author> findAll() {
        return entityManager.createQuery("SELECT a FROM Author a", Author.class).getResultList();
    }

    @Override
    public Author findById(Integer id) {
        return entityManager.find(Author.class, id);
    }

    @Override
    public void persist(Author author) {
        entityManager.persist(author);
    }

    @Override
    public void update(Author author) {
        entityManager.merge(author);
    }

    @Override
    public void delete(Integer id) {
        var obj = findById(id);
        if (obj != null) {
            entityManager.remove(obj);
        }
    }
}
