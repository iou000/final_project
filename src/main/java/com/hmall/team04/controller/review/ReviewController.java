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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ProductPageDTO;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.service.category.CategoryService;
import com.hmall.team04.service.like.LikeService;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/r")
public class ReviewController {
	
	@Autowired
	private ProductBoardService productboardService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CategoryService categoryService;
	
	/* 리뷰 쓰기 */
	@RequestMapping("/Enroll/{memberId}")
	public String reviewEnrollWindowGET(@PathVariable("memberId")String memberId, String prd_board_id, Model model) {
		log.info(prd_board_id);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("prd_board_id", prd_board_id);
		
		return "review/reviewEnroll";
	}
	
	@RequestMapping(value = "/{prd_board_id}", method = RequestMethod.GET)
	public String productlist(@PathVariable String prd_board_id, Model model) {
//		String cate = "";
//		ProductCriteria cri = new ProductCriteria(category);
		
		// pathvariable로 전달 받을 예정인 값
		//String prd_board_id="prd_board_id_tmp1";
		ReviewCriteria reviewcri = new ReviewCriteria(prd_board_id);
		
 		try {
// 			ArrayList<ProductBoardDTO> productBoardDTO = reviewService.getReviewListByInsdt(cri);
// 			int total = reviewService.getReviewListCount(category);
 			
 			ArrayList<ReviewDTO> reviewDTO = reviewService.getReviewListByInsdtCore(reviewcri);
 			int totalCore = reviewService.getReviewListCountCore(prd_board_id);
			
// 			cate = categoryService.getCategoryName(category);
//			model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
//			model.addAttribute("productBoardDTO", productBoardDTO);
			
			ReviewPageDTO reviewpageDTO = new ReviewPageDTO(reviewcri, totalCore);
			log.info(reviewpageDTO);
			
			model.addAttribute("reviewpageMaker", new ReviewPageDTO(reviewcri, totalCore));
			model.addAttribute("reviewDTO", reviewDTO);
			
//			model.addAttribute("category", cate);
//			model.addAttribute("categoryCode", category);
			
			model.addAttribute("prd_board_id", prd_board_id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "review.review";
	}
	
//	@RequestMapping(value = "/{prd_board_id}", method = RequestMethod.GET)
//	public String product(@PathVariable String prd_board_id, Model model,Principal principal) {
//		log.info("소분류에서 상품 선택에 따른 페이지");
//		log.info(prd_board_id);
//		
//		String user_id="";
//		
//		if(principal != null) {
//			// 로그인 상태에서 Like 여부 판단
//			user_id=principal.getName();
//			
//			LikeDTO likeDTO = new LikeDTO();
//			likeDTO.setPrd_board_id(prd_board_id);
//			likeDTO.setUser_id(user_id);
//			
//			try {
//				
//				
//				int likeIsExist = likeService.likeIsExist(likeDTO);
//				log.info(likeIsExist);
//				model.addAttribute("likeIsExist", likeIsExist);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//			
//		}
//		
//		
//		try {
//			// 상품 게시판 가져오기
//			ProductBoardDTO productboadDTO = productboardService.getProductBoard(prd_board_id);
//			log.info(productboadDTO.toString());
//
//			// like
//			int likeCnt = likeService.getLikeCnt(prd_board_id);
//			
//			LikeDTO likeDTO = new LikeDTO();
//			
//			// 상품 게시판 관련 기본댓글 가져오기
//			Criteria cri = new Criteria();
//			cri.setPrd_board_id(prd_board_id);
//			//ReviewPageDTO reviewList = reviewService.reviewList(cri);
//			//log.info(reviewList.toString());
//			
//			
//			
//			model.addAttribute("productboadDTO", productboadDTO);
//			model.addAttribute("likeCnt", likeCnt);
//			
////			model.addAttribute("reviewList", reviewList);
//
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//		
//		return "product.productBoard";
//	}
	
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
