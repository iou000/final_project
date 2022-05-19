package com.hmall.team04.controller.user;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping("/step2")
	   public String step2(@RequestParam(value="check_agree0") String check_agree0,
			   			   @RequestParam(value="check_agree1") String check_agree1) {
		
		
		log.info("개인정보 입력 페이지 요청");
		log.info("[필수] 이용 약관 : " + check_agree0);
		log.info("[필수] 개인정보 수집.이용 동의 : " + check_agree1);
		
		// 필수 동의 확인
		if(check_agree0.equals("Y") && check_agree1.equals("Y")) {
			return "user.signup.step2";
		} else {
			return "redirect:./step1";
		}
	}
	
	@GetMapping("/step3")
	public String step3() {
		log.info("가입 완료 페이지 요청");
		return "user.signup.step3";
	}
}
