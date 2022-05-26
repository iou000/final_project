package com.hmall.team04.controller.review;


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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.review.ReviewPageDTO;
import com.hmall.team04.service.cart.CartService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	/* 리뷰 쓰기 */
	@GetMapping("/reviewEnroll/{memberId}")
	public String reviewEnrollWindowGET(@PathVariable("memberId")String memberId, String prd_board_id, Model model) {
		log.info(prd_board_id);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("prd_board_id", prd_board_id);
		
		return "review/reviewEnroll";
	}
	
//	@PreAuthorize("isAuthenticated()")
//	@RequestMapping(value = "/basktList", method= RequestMethod.GET)
//	public String cart(HttpServletRequest req,HttpServletResponse res, Model model, Principal principal) {
//		
//		HttpSession session=req.getSession();
//		ArrayList<CartDTO> cartList;
//		
//		log.info(session.getAttribute("id"));
//		log.info(principal.getName());
//		
//		try {
//			cartList = cartService.getCartList(principal.getName());
//			log.info(cartList.toString());
//			
//			model.addAttribute("cartList", cartList);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//		return "cart.cart";
//	}
//	
//	@RequestMapping(value = "/deletePrdCartId", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public HashMap<String, String> deletePrdCartId(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
//		
//		log.info("deletePrdCartId "+cartDTO.toString());
//		
//		cartService.deletePrdCartId(cartDTO);
//		
//		HashMap<String,String> map = new HashMap<String,String>();
//		map.put("delete_PrdCartId_Success", "True");
//		
//		return map;
//	}	
//	
//	@RequestMapping(value = "/updatePrdCartQty", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public HashMap<String, String> updatePrdCartQty(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
//		
//		log.info("updatePrdCartQty "+cartDTO.toString());
//		
//		cartService.updatePrdCartQty(cartDTO);
//		
//		HashMap<String,String> map = new HashMap<String,String>();
//		map.put("update_PrdCartQty_Success", "True");
//		
//		return map;
//	}
}