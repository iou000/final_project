package com.hmall.team04.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j

@RequestMapping("/cs")
public class CSController {
	
	@GetMapping("/main.do")
	public String main() {
		return "cs.main";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "cs.notice.notice";
	}
	
	@GetMapping("/notice/{n}")
	public String noticearticle() {
		return "cs.notice.noticearticle";
	}
	
	@GetMapping("/question")
	public String question() {
		return "cs.qna.question";
	}
	
	@GetMapping("/findByOrder")
	public String findByOrderGet() {
		log.info("findByOrderPopUp");
		return "/cs/qna/findinorderlist";
	}
}
