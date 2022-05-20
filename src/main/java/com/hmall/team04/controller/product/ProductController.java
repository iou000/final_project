package com.hmall.team04.controller.product;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/pdatemp")
public class ProductController {
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product() {
		log.info("소분류에서 상품 선택에 따른 페이지");
		return "product";
	}
}
