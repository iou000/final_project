package com.hmall.team04.dao.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewDAO {

	// 상품 게시판 관련 댓글들
	ArrayList<ReviewDTO> getReviewListBasic(String prd_board_id) throws SQLException;
	
	// 상품 게시판 관련 댓글 추가
	void enrollReview(ReviewDTO reviewDTO) throws SQLException;
	
	/* 댓글 페이징 */
	public List<ReviewDTO> getReviewList(Criteria cri) throws SQLException;
	
	/* 댓글 총 갯수(페이징) */
	public int getReviewTotal(String prd_board_id) throws SQLException;
}
