package com.hmall.team04.service.review;

import java.util.ArrayList;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.review.ReviewPageDTO;

public interface ReviewService {

	void enrollReview(ReviewDTO reviewDTO) throws Exception;
	
	/* 댓글 페이징 */
	public ReviewPageDTO reviewList(Criteria cri) throws Exception;

}
