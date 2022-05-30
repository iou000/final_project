package com.hmall.team04.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hmall.team04.dto.category.CategoryDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.service.category.CategoryService;
import com.hmall.team04.service.product.ProductBoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductBoardService productboardService;
	@Autowired
	private CategoryService categoryService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// index화면 호출 시, 관련 product board list 담아주기
//		try {
//			ArrayList<ProductBoardDTO> productboadrList = productboardService.getProductBoardList();
//			model.addAttribute("productboadrList", productboadrList);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.getStackTrace();
//		}
		
		//
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		return "index";
	}
	
}
