package com.hmall.team04.service.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ReviewDAO reviewDAO;

	@Override
	public ArrayList<ReviewDTO> getReviewList(String prd_board_id) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewList(prd_board_id);
	}


}
