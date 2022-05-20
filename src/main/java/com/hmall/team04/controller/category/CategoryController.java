package com.hmall.team04.controller.category;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dpa")
public class CategoryController {
	
	@RequestMapping(value = "/depth1", method = RequestMethod.GET)
	public String level2() {
		log.info("카테고리 대분류 && 중분류 선택에 따른 페이지");
		return "category";
	}
	
	@RequestMapping(value = "/depth1/depth2", method = RequestMethod.GET)
	public String level3() {
		log.info("카테고리 대분류 && 중분류 && 소분류 선택에 따른 페이지");
		return "category2";
	}
}
