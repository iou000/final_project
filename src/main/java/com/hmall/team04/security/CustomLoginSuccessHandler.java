package com.hmall.team04.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Override
	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		String s = request.getParameter("_to");
		System.out.println(s);
		if(s != null)
			return s;
		else
			return super.determineTargetUrl(request, response);
	}
   @Override
   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
         throws IOException, ServletException {

      String contextPath = request.getContextPath();
      
      log.warn("Login Success");

      List<String> roleNames = new ArrayList<>();

      
      for(GrantedAuthority authority : auth.getAuthorities()) {
         log.info("GrantedAuthority :::::> " + authority);
         roleNames.add(authority.getAuthority());
      }

      log.warn("ROLE NAMES: " + roleNames);

      

      response.sendRedirect(contextPath + "/board/list");
   }
}