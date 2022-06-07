package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.file.FileDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.dto.file.FileDTO;
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
	
	@Setter(onMethod_ = @Autowired)
	private FileDAO fileDAO;
	
	@Value("${s3.bucketname}")
	private String BUCKET_NAME;

	@Value("${s3.accesskey}")
	private String ACCESS_KEY;
	
	@Value("${s3.secretkey}")
	private String SECRET_KEY;

	
	@Test
	public void testprint() {

		log.info(BUCKET_NAME);
		log.info(ACCESS_KEY);
		log.info(SECRET_KEY);
	}
	
	@Test
	public void testInsertReviewProductBoard() {
		// review_t
		String prd_board_id="200";
		String prd_id="test1";
		String user_id="LikeReviewWacher";
		String content="review_content_tmp"+user_id;

		int star=3;
		int file_yn=1;
		
		ReviewDTO reviewDTO = new ReviewDTO();
		
		reviewDTO.setPrd_board_id(prd_board_id);
		reviewDTO.setPrd_id(prd_id);
		reviewDTO.setUser_id(user_id);
		reviewDTO.setContent(content);
		reviewDTO.setStar(star);
		reviewDTO.setFile_yn(file_yn);
		
		log.info(reviewDTO);
		
		try {
			reviewDAO.insertReview(reviewDTO);
			log.info(reviewDTO.getReview_id());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testgetReviewListByInsdtCore() {
		// review_t
		ReviewCriteria reviewcri = new ReviewCriteria(1, 10, "200");
		ArrayList<ReviewDTO> reviewDTO = null;
		ReviewPageDTO reviewpageMaker = null;
		
		ArrayList<FileDTO> fileDTO = null;
		
		try {
			reviewDTO = reviewDAO.getReviewListByInsdtCore(reviewcri);
			
			for(int i=0;i<reviewDTO.size();i++) {
				log.info(reviewDTO.get(i));
				
				if(reviewDTO.get(i).getFile_yn()==1) {
					FileDTO file = new FileDTO();
					file.setArticle_id(reviewDTO.get(i).getReview_id());
					file.setBoard_flag("review");
					
					fileDTO = fileDAO.getReviewFileList(file);
					reviewDTO.get(i).setFileList(fileDTO);
					log.info(reviewDTO.get(i));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}