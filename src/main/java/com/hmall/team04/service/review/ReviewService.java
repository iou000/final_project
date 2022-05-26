package com.hmall.team04.service.review;

import java.util.ArrayList;

import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewService {
	//
	ArrayList<ReviewDTO> getReviewList(String prd_board_id) throws Exception;

}
