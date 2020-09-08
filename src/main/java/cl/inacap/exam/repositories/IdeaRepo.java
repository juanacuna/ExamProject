package cl.inacap.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cl.inacap.exam.models.Idea;

@Repository
public interface IdeaRepo extends CrudRepository<Idea, Long>{

	List<Idea> findAll();
	
}
