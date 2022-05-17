package com.hmall.team04.controller.user;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signUp")
public class SignUpController {
	
	@GetMapping("/signUpStart")
	public String signUpStart() {
		log.info("회원 구분 페이지 요청");
		return "user.signup.signUpStart";
	}
	
	@GetMapping("/step1")
	public String step1() {
		log.info("약관동의 페이지 요청");
		return "user.signup.step1";
	}
	
	@GetMapping("/step2")
	   public String step2() {
		log.info("개인정보 입력 페이지 요청");
		return "user.signup.step2";
	   }
	
	@GetMapping("/step3")
	public String step3() {
		log.info("가입 완료 페이지 요청");
		return "user.signup.step3";
	}
}
