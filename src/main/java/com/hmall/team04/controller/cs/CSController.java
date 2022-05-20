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
		return "cs.faq.faqMainList";
	}
	
	@GetMapping("/faq")
	public String faq() {
		return "cs.faq.faqList";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "cs.notice.noticeList";
	}
	
	@GetMapping("/notice/{n}")
	public String noticearticle() {
		return "cs.notice.noticearticle";
	}
	
	@GetMapping("/question")
	public String question() {
		return "cs.qna.qnaList";
	}
	
	
	@GetMapping("/findByOrder")
	public String findByOrderGet() {
		log.info("findByOrderPopUp");
		return "/cs/qna/findinorderlist";
	}
}
