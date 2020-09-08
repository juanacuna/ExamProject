package cl.inacap.exam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cl.inacap.exam.models.Idea;
import cl.inacap.exam.models.User;
import cl.inacap.exam.services.IdeaService;

@Controller
public class IdeaController {

	@Autowired
	private IdeaService ideaService;
	
	
	
	
	
	@GetMapping("/ideas/like/{id}")
	public String likeIdea(@ModelAttribute("idea") Idea idea,
			@PathVariable("id") Long id, 
			HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}
		
		Idea i = this.ideaService.findById(id);
		i.getLikers().add(user);
		
		this.ideaService.saveIdea(i);
	
		return "redirect:/ideas";
	}
	
	@GetMapping("/ideas/unlike/{id}")
	public String unlikeIdea(@ModelAttribute("event") Idea event, @PathVariable("id") Long id, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}		
		Idea i = this.ideaService.findById(id);
		i.removeLike(user);
		this.ideaService.saveIdea(i);
		return "redirect:/ideas";
	}
	
	@GetMapping("/ideas/{id}")
	public String showIdea(@ModelAttribute("Idea") Idea idea, @PathVariable("id") Long id, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}
		
		Idea i = this.ideaService.findById(id);
		model.addAttribute("idea", i);
		model.addAttribute("likers", i.getLikers());
		return "showidea";
	}
	
	@GetMapping("/ideas/{id}/edit")
	public String editIdea(@ModelAttribute("idea") Idea idea, @PathVariable("id") Long id, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}
		
		Idea i = this.ideaService.findById(id);
		if (i.getUser().getId() == user.getId()) {
			model.addAttribute("idea", i);
			return "editidea";
		}
		
		return "redirect:/ideas";
	}
	@RequestMapping(value = "/ideas/{id}/edit", method=RequestMethod.PUT)
	public String editIdea(@Valid @ModelAttribute("idea") Idea idea,  @PathVariable("id") Long id, BindingResult result, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}
		Idea i = this.ideaService.findById(id);
		
		if (i.getUser().getId() == user.getId()) {
			if (result.hasErrors()) {
				return "ideas";
			}

			idea.setUser(user);
			this.ideaService.saveIdea(idea);
		}
		
		return "redirect:/ideas";
		
	}
	
	
	@RequestMapping(value = "/ideas/{id}/delete", method=RequestMethod.DELETE)
	public String delIdea(@ModelAttribute("idea") Idea idea, @PathVariable("id") Long id, HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/logout";
		}
		
		Idea i = this.ideaService.findById(id);
		if (i.getUser().getId() == user.getId()) {
			this.ideaService.delIdea(id);
		}
		
		return "redirect:/ideas";
	}
}
