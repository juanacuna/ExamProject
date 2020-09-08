package cl.inacap.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cl.inacap.exam.models.User;

@Repository
public interface UserRepo extends CrudRepository<User, Long> {
	
	List<User> findAll();
	
	User findByEmail(String email);

}
