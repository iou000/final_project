package com.hmall.team04.dao.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewDAO {

	// 최근 등록 순에 따라 댓글
	ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws SQLException;

	int getReviewListCountCore(String prd_board_id) throws SQLException;
	
	// 상품 게시판 관련 댓글 추가
	void insertReview(ReviewDTO reivewDTO) throws SQLException;

	// 댓글 등록 여부 판단
	int ReviewIsExist(ReviewDTO reviewDTO) throws SQLException;

	int ReviewIsPossible(ReviewDTO reviewDTO) throws SQLException;


}
