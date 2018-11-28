package ru.springmvchibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.springmvchibernate.model.Role;
import ru.springmvchibernate.model.User;
import ru.springmvchibernate.service.abstraction.role.RoleService;
import ru.springmvchibernate.service.abstraction.user.UserService;

import javax.persistence.NoResultException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping("/test")
	public String getIndex(Model model){
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "index";
	}

	@RequestMapping(value="/admin/allusers", method = RequestMethod.GET)
	public String allUsersGet(Model model){
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "allusers";
	}

/*	@RequestMapping(value="/admin/adduser", method= RequestMethod.POST)
	//TODO  поправить adduser редирект на allusers
	public String add(@RequestParam String name, @RequestParam String login, @RequestParam String password, @RequestParam String role, Model model)
	{
		User newUser = new User(name, login, password, role);
		userService.saveUser(newUser);
		List<User> users =  userService.getAllUsers();
		model.addAttribute("users", users);
		return "redirect:/admin/allusers";
	}*/


	@RequestMapping(value="/admin/deluser/{id}", method = RequestMethod.GET)
		public String delUser(@PathVariable("id") long id, Model model){
		long userIdToDel = id;
		userService.deleteUser(userIdToDel);
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "redirect:/admin/allusers";
	}

	@RequestMapping(value="/admin/edituser/{id}", method = RequestMethod.GET)
	public String editUser(@PathVariable("id") long id, Model model) {
		long userIdToEdit = id;
		User userToEdit =  userService.getUserById(userIdToEdit);
		model.addAttribute("user", userToEdit);
		return "edituser";
	}

/*	@RequestMapping(value="/admin/edituser", method = RequestMethod.POST)
	public String saveUser(@RequestParam String id, @RequestParam String name, @RequestParam String login, @RequestParam String password, @RequestParam String role, Model model) {
		long userIdToEdit = Long.parseLong(id);
		User newUser = new User(userIdToEdit, name, login, password, role);
		userService.editUser(newUser);
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "redirect:/admin/allusers";
	} */


	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public String getWelcome(){
		return "welcome";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap modelMap) {
		return "login";
	}


	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String userPage(ModelMap modelMap) {
		modelMap.addAttribute("user", getPrincipal());
		return "user";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap modelMap) throws Exception {
		modelMap.addAttribute("adminRole", new Role("Admin"));
		modelMap.addAttribute("userRole", new Role("User"));
		modelMap.addAttribute("adminName", getPrincipal());
		modelMap.addAttribute("users", userService.getAllUsers());
		return "admin";
	}


	@RequestMapping(value = "/admin/add", method = RequestMethod.GET)
	public String addUserPage(ModelMap modelMap) {
		return "add";
	}


	@RequestMapping(value = "/admin/add", method = RequestMethod.POST)
	public String addUserPage(@RequestParam(value = "name") String name,
							  @RequestParam(value = "login") String login,
							  @RequestParam(value = "password") String password,
							  @RequestParam(value = "role") Set<Role> roles) throws UsernameNotFoundException {
		if (roles.size() == 0) {
			return "redirect:/admin/add?error";
		} else if (password.equals("")) {
			return "redirect:/admin/add?error";
		} else if (login.equals("")) {
			return "redirect:/admin/add?error";
		} else if (name.equals("")) {
			return "redirect:/admin/add?error";
		}
		Set<Role> roleSet = new HashSet<>();
		for (Role role : roles) {
			try {
				roleSet.add(roleService.getByRoleName(role.getRoleName()));
			} catch (NoResultException exp) {

			}
		}
		User user = new User(name, login, password, roleSet);

		userService.saveUser(user);
		return "redirect:/admin";
	}


	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof User) {
			userName = ((User) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
