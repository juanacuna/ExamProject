package cl.inacap.exam.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.inacap.exam.models.User;
import cl.inacap.exam.repositories.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassw(), BCrypt.gensalt());
		user.setPassw(hashed);
		return userRepo.save(user);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public User findUserById(Long id) {
		Optional<User> u = userRepo.findById(id);

		if (u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = userRepo.findByEmail(email);
		if (user == null) {
			return false;
		}
		return BCrypt.checkpw(password, user.getPassw());
	}
}
