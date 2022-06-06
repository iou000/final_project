package com.hmall.team04.controller.review;


import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
import com.hmall.team04.service.file.FileServiceImpl;
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
	
	@Autowired
	private FileServiceImpl awsS3Service;
	
	/* 리뷰 쓰기 */
	@RequestMapping("/insert/{user_id}")
	public String reviewInsertWindowGET(@PathVariable("user_id")String user_id,
															 String prd_board_id,
															 String prd_id,
															 Principal principal,
															 Model model) {
		log.info(prd_board_id);
		
		if(principal == null) {
			return "redirect:/loginpopup";
		} else {
			
			model.addAttribute("user_id", user_id);
			model.addAttribute("prd_board_id", prd_board_id);
			model.addAttribute("prd_id", prd_id);
			
			return "review/reviewInsert";
			
		}
	}
	
	@RequestMapping(value = "/{prd_board_id}", method = RequestMethod.GET)
	public String productlist(@PathVariable String prd_board_id, Model model,Principal principal) {
		
		if(principal != null) {
			// 로그인 상태에서 Like 여부 판단
			String user_id=principal.getName();
			
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setPrd_board_id(prd_board_id);
			reviewDTO.setUser_id(user_id);
			
			try {
				int reviewIsExist = reviewService.ReviewIsExist(reviewDTO);
				int reviewIsPossible = reviewService.ReviewIsPossible(reviewDTO);
				log.info(reviewIsPossible);
				model.addAttribute("reviewIsExist", reviewIsExist);
				model.addAttribute("reviewIsPossible", reviewIsPossible);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		
		// pathvariable로 전달 받을 예정인 값
		//String prd_board_id="prd_board_id_tmp1";
		ReviewCriteria reviewcri = new ReviewCriteria(prd_board_id);
		
 		try {
 			
 			ArrayList<ReviewDTO> reviewDTO = reviewService.getReviewListByInsdtCore(reviewcri);
 			int totalCore = reviewService.getReviewListCountCore(prd_board_id);
			
			ReviewPageDTO reviewpageDTO = new ReviewPageDTO(reviewcri, totalCore);
			//log.info(reviewpageDTO);
			
			model.addAttribute("reviewpageMaker", new ReviewPageDTO(reviewcri, totalCore));
			model.addAttribute("reviewDTO", reviewDTO);
			
			model.addAttribute("prd_board_id", prd_board_id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "review.review";
	}
	
	@RequestMapping(value = "/uploadS3", method= {RequestMethod.POST})
	@ResponseBody
	public void uploadS3(ReviewDTO reviewDTO) throws Exception {
		log.info(reviewDTO.toString());
		MultipartFile file = reviewDTO.getUploadfile();
		log.info(file);
		
		awsS3Service.s3FileUpload(file);
		
	}
	
	@RequestMapping(value = "/insertReview", method= {RequestMethod.POST})
	@ResponseBody
	public HashMap<String, String> insertReview(ReviewDTO reviewDTO) throws Exception {
		log.info(reviewDTO.toString());
		
		reviewService.insertReview(reviewDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("insert_review_Success", "True");
		
		return map;
	}
	
}
