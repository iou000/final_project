package com.hmall.team04.service.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.PageDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.review.ReviewPageDTO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ReviewDAO reviewDAO;


	@Override
	public void enrollReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.enrollReview(reviewDTO);
	}

	@Override
	public ReviewPageDTO reviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		ReviewPageDTO dto = new ReviewPageDTO();
		
		dto.setList(reviewDAO.getReviewList(cri));
		dto.setPageInfo(new PageDTO(cri, reviewDAO.getReviewTotal(cri.getPrd_board_id())));
		
		return dto;
	}


}
