package br.com.starwars.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.starwars.models.Planeta;

@Repository
@Transactional
public class PlanetaDao {
	
	@PersistenceContext
	private EntityManager manager;

	public void gravar( Planeta planeta ) {
		manager.persist(planeta);
	}
	
	public List<Planeta> listar(){
		return null;
	}
}