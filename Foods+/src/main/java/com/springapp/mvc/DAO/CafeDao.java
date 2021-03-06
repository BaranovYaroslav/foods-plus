package com.springapp.mvc.DAO;

import com.springapp.mvc.Cafe;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class CafeDao extends AbstractDao<Cafe> {

    @Override
    public Cafe getById(int id) {
        return entityManager.find(Cafe.class, id);
    }

    @Override
    public List<Cafe> getALl() {
        TypedQuery<Cafe> typedQuery = (TypedQuery<Cafe>) entityManager.createQuery("SELECT c FROM Cafe c");
        return typedQuery.getResultList();
    }
}
