package com.hmall.team04.dao.review;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewDAO {

	// 상품 게시판 관련 댓글들
	ArrayList<ReviewDTO> getReviewList(String prd_board_id) throws SQLException;
}
