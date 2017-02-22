package com.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.model.Morador;

public class MoradorDao {

	public void persist(Morador morador){
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Condominio");
	EntityManager em = emf.createEntityManager();
	em.getTransaction().begin();
	try {
		em.persist(morador);
        em.getTransaction().commit();
	} catch (Exception e) {
		e.printStackTrace();
		em.getTransaction().rollback();
	}finally {
		em.close();
		
	   }
	}
}
