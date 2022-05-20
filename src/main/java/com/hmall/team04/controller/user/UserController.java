package com.hmall.team04.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.hmall.team04.service.user.UserService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UserController {
	
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/loginpopup")
	public String loginpopup(HttpServletRequest request, Model model){
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
		return "user/login/loginPopup";
	}
	
	@GetMapping("/customLogin")
	   public void loginInput(String error, String logout, Model model) {
	      log.info("error" + error);
	      log.info("logout" + logout);
	      
	      if(error != null) {
	         model.addAttribute("error", "Login Error check your Account");
	      }
	      
	      if(logout != null) {
	         model.addAttribute("logout", "LoginOut!! ");
	      }
	   }
	
	@GetMapping("/customLogout")
	public String logoutGET(HttpServletRequest request, Model model) {
		log.info("custom logout");
		return "redirect:/";
	}
	
	@GetMapping("/findIdNameEmail")
	public String findIdNameEmail() {
		log.info("find id by email and name");
		return "user.find.findId";
	}
	
	@PostMapping("/findIdNameEmail")
	public String findIdNameEmail(String usernm, String email, Model model) {
		userService.findIdbyNameEmail(usernm, email);
		return "user/find/findId";
	}
}
