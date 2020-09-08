package cl.inacap.exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.inacap.exam.models.Idea;
import cl.inacap.exam.repositories.IdeaRepo;

@Service
public class IdeaService {

	@Autowired
	private IdeaRepo ideaRepo;
	
	public Idea findById(Long id) {
		Optional<Idea> op = this.ideaRepo.findById(id);
		return op.isPresent() ? op.get() : null;
	}
	
	public void delIdea(Long id) {
		this.ideaRepo.deleteById(id);
	}
	
	public Idea saveIdea(Idea idea) {
		return this.ideaRepo.save(idea);
	}

	public List<Idea> findAllIdeas() {
		return this.ideaRepo.findAll();
	}
}
