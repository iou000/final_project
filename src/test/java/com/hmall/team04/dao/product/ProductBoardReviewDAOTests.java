package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductBoardReviewDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
	@Test
	public void testInsertReviewProductBoard() {
		// review_t
		String prd_board_id="prd_board_id_tmp1";
		
		String user_id="22";
		String content="review_content_tmp"+user_id;
		int star=3;
		int file_yn=1;
		
		ReviewDTO reviewDTO = new ReviewDTO();
		
		reviewDTO.setPrd_board_id(prd_board_id);
		reviewDTO.setUser_id(user_id);
		reviewDTO.setContent(content);
		reviewDTO.setStar(star);
		reviewDTO.setFile_yn(file_yn);
		
		log.info(reviewDTO);
		
		try {
			reviewDAO.enrollReview(reviewDTO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	@Test
	public void testGetReviewProductBoard() {
		
		ArrayList<ReviewDTO> list;
		try {
			list = reviewDAO.getReviewListBasic("prd_board_id_tmp1");
			
			for(int i=0;i<list.size();i++) {
				log.info(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void getReviewCount() {
		// review_t
		
		try {
			reviewDAO.getReviewCount("prd_board_id_tmp1");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testgetReviewListByInsdtCore() {
		// review_t
		ReviewCriteria reviewcri = new ReviewCriteria(2, 10, "prd_board_id_tmp1");
		ArrayList<ReviewDTO> reviewDTO = null;
		ReviewPageDTO reviewpageMaker = null;
		
		try {
			reviewDTO = reviewDAO.getReviewListByInsdtCore(reviewcri);
			log.info(reviewDTO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}