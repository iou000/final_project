package com.hmall.team04.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UserController {
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/loginpopup")
	public void loginpopup(@RequestHeader("Referer") String from, Model model){
		model.addAttribute("_to", from);
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
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}

}
