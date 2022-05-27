package com.hmall.team04.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/odslist")
	public String odslist() {
		return "mypage.mypageODSList";
	}
	
	@GetMapping("/mymain") 
	public String mypage() {
		return "mypage.mypageMainList";
	}
	
	@GetMapping("/crelist") 
	public String crelist() {
		return "mypage.mypageCREList";
	}
	
}
