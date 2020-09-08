package cl.inacap.exam.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.inacap.exam.models.Idea;
import cl.inacap.exam.models.User;
import cl.inacap.exam.services.IdeaService;
import cl.inacap.exam.services.UserService;
import cl.inacap.exam.validators.ProjectValidator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private IdeaService ideaService;
	
	@Autowired
	private ProjectValidator projectValidator;
	
	@GetMapping("/")
	public String registerForm(@ModelAttribute("user") User user) {
		return "index";
	}
	
	@GetMapping("/ideas")
	public String home(HttpSession session, Model model, @ModelAttribute("idea") Idea idea) {
		Long id = (Long) session.getAttribute("userId");
		if( id == null) {
			return "redirect:/";
		}
		User u = userService.findUserById(id);
		model.addAttribute("user", u);
		model.addAttribute("allIdeas", ideaService.findAllIdeas());
		return "ideas";
	}
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
		this.projectValidator.validate(user, result);
		if (result.hasErrors()) {
			return "index";
		}
		if (userService.findByEmail(user.getEmail()) != null){
			redirectAttributes.addFlashAttribute("error", "User already exist");
			return "redirect:/";
		}
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		session.setAttribute("user", u);
		return "redirect:/ideas";
	}
	
	@PostMapping("/newidea")
	public String newIdea(@Valid @ModelAttribute("idea") Idea idea, BindingResult result, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		
		User u = (User)session.getAttribute("user");
		if (u == null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) { return "newidea"; }
		idea.setUser(u);
		this.ideaService.saveIdea(idea);
		session.setAttribute("ideaId", idea.getId());
		model.addAttribute("idea", idea);
		return "redirect:/ideas";
	}
	
	@GetMapping("/ideas/new")
	public String newIdea(@ModelAttribute("idea") Idea idea) {
		return "newIdea";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("user") User user, @RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpSession session) {
		if (this.userService.authenticateUser(email, password)) {
			User u = this.userService.findByEmail(email);
			session.setAttribute("user", u);
			model.addAttribute("user", u);
			session.setAttribute("userId", u.getId());
			return "redirect:/ideas";
		}
		model.addAttribute("error", "Invalid Credentials. Please try again");
		return "index";
	}
	
	
	
	
	
	
	
	
	
}
