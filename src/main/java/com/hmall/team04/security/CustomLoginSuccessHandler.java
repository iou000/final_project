package com.hmall.team04.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hmall.team04.dto.common.ResponseDataCode;
import com.hmall.team04.dto.common.ResponseDataDTO;
import com.hmall.team04.dto.common.ResponseDataStatus;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	 
	 @Override
	 public void onAuthenticationSuccess(HttpServletRequest request,
				HttpServletResponse response, Authentication authentication)
				throws IOException, ServletException {
		 	ObjectMapper mapper = new ObjectMapper();	//JSON 변경용
	    	String rememeberID = (String) request.getAttribute("rememberId");
	    	//아이디 저장을 체크했을 때
	    	log.info("---------------------test: " + request.getAttribute("rememberId"));
	    	if (rememeberID.equals("r")) {
	    		log.info("-----------------test----------------------------");
	    		// 쿠키에 ID를 저장한다. 저장하는 아이디는 하루동안 쿠키에 저장하는 걸로 설정
	    		Cookie oldCookie = null;
			    Cookie[] cookies = request.getCookies();
	    		if (cookies != null) {
			        for (Cookie cookie : cookies) {
			            if (cookie.getName().equals("REMEMBERID")) {
			            	oldCookie = cookie;
			            }
			        }
			    }
	    		if (oldCookie != null) {
	    			oldCookie.setMaxAge(60 * 60 * 24);
	    			oldCookie.setValue(authentication.getName());
	            	response.addCookie(oldCookie);
	    		}
	    		else {
	    			Cookie newCookie = new Cookie("REMEMBERID", authentication.getName());
	    			newCookie.setMaxAge(60 * 60 * 24);
	    			newCookie.setValue(authentication.getName());
	            	response.addCookie(newCookie);
	    		}
	    	}
	    	ResponseDataDTO responseDataDTO = new ResponseDataDTO();
	    	responseDataDTO.setCode(ResponseDataCode.SUCCESS);
	    	responseDataDTO.setStatus(ResponseDataStatus.SUCCESS);
	    	
	    	String prevPage = request.getSession().getAttribute("prevPage").toString();	//이전 페이지 가져오기
	    	 
	    	Map<String, String> items = new HashMap<String,String>();	
	    	items.put("url", prevPage);	// 이전 페이지 저장
	    	responseDataDTO.setItem(items);
	    	
	    	response.setCharacterEncoding("UTF-8");
	        response.setStatus(HttpServletResponse.SC_OK);
	        response.getWriter().print(mapper.writeValueAsString(responseDataDTO));
	        response.getWriter().flush();
			
		}
}