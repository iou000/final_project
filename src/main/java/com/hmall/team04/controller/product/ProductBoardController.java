package com.hmall.team04.controller.product;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.review.ReviewPageDTO;
import com.hmall.team04.service.like.LikeService;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductBoardController {
	
	@Autowired
	private ProductBoardService productboardService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value = "/selectBoard", method = RequestMethod.GET)
	public String product(@RequestParam(name="prd_board_id", defaultValue="1") String prd_board_id, Model model,Principal principal) {
		log.info("소분류에서 상품 선택에 따른 페이지");
		log.info(prd_board_id);
		
		String user_id="";
		
		if(principal != null) {
			// 로그인 상태에서 Like 여부 판단
			user_id=principal.getName();
			try {
				int likeIsExist = likeService.likeIsExist(user_id);
				log.info(likeIsExist);
				model.addAttribute("likeIsExist", likeIsExist);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		
		
		try {
			// 상품 게시판 가져오기
			ProductBoardDTO productboadDTO = productboardService.getProductBoard(prd_board_id);
			log.info(productboadDTO.toString());

			// like
			int likeCnt = likeService.getLikeCnt(prd_board_id);
			
			LikeDTO likeDTO = new LikeDTO();
			
			// 상품 게시판 관련 기본댓글 가져오기
			Criteria cri = new Criteria();
			cri.setPrd_board_id(prd_board_id);
			ReviewPageDTO reviewList = reviewService.reviewList(cri);
			log.info(reviewList.toString());
			
			
			
			model.addAttribute("productboadDTO", productboadDTO);
			model.addAttribute("likeCnt", likeCnt);
			
//			model.addAttribute("reviewList", reviewList);

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "product.productBoard";
	}
	
	@RequestMapping(value = "/insertlik", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(OrderDTO orderDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info("hi i am oda order.do");
		log.info(orderDTO.toString());
		
		HttpSession session=req.getSession();
		
		session.setAttribute("orderInfo", orderDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("orderSuccess", "True");
		
		return map;
	}
	
}
