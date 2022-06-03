package com.hmall.team04.service.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewService {

	void enrollReview(ReviewDTO reviewDTO) throws Exception;
	
	// Read Artilce list with Paging method
	long getReviewCount(String prd_board_id) throws Exception;
	
	
	List<ReviewDTO> getReviewListPage(String prd_board_id,long pg) throws Exception;
	
	//상품게시글에 따른 상품리스트
	ArrayList<ProductBoardDTO> getReviewListByInsdt(ProductCriteria cri) throws Exception;
	
	int getReviewListCount(String category) throws Exception;

	ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws Exception;
	
	int getReviewListCountCore(String prd_board_id) throws Exception;

//	ArrayList<ProductBoardDTO> getProductBoardListByInsdt(ProductCriteria cri) throws Exception;
//	
//	ArrayList<ProductBoardDTO> getProductBoardListByHighPrice(ProductCriteria cri) throws Exception;
//	
//	ArrayList<ProductBoardDTO> getProductBoardListByRowPrice(ProductCriteria cri) throws Exception;
//
//	int getProductListCount(String category) throws Exception;
}
