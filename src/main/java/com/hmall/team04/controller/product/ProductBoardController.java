package com.hmall.team04.controller.product;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/pda")
public class ProductBoardController {
	
	@Autowired
	private ProductBoardService productboardService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/selectBoard", method = RequestMethod.GET)
	public String product(@RequestParam(name="prd_board_id", defaultValue="1") String prd_board_id, Model model) {
		log.info("소분류에서 상품 선택에 따른 페이지");
		log.info(prd_board_id);
		
		try {
			// 상품 게시판 가져오기
			ProductBoardDTO productboadDTO = productboardService.getProductBoard(prd_board_id);
			log.info(productboadDTO.toString());
			// 상품 게시판 관련 기본댓글 가져오기
			ArrayList<ReviewDTO> reviewList = reviewService.getReviewList(prd_board_id);
			log.info(reviewList.toString());
			
			model.addAttribute("productboaddto", productboadDTO);
			model.addAttribute("reviewList", reviewList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "product.productBoard";
	}
}
