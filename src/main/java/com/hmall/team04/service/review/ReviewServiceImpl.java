package com.hmall.team04.service.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.PageDTO;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ProductBoardDAO productboardDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private ReviewDAO reviewDAO;
	
	private int pageSize=10;

	@Override
	public void enrollReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}

//	@Setter(onMethod_ = { @Autowired })
//	private ProductBoardDAO productboardDAO;
//	
//	@Override
//	public ProductBoardDTO getProductBoard(String prd_board_id) throws Exception {
//		// TODO Auto-generated method stub
//		return productboardDAO.getProductBoard(prd_board_id);
//	}
//	
	@Override
	public long getReviewCount(String prd_board_id) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewCount(prd_board_id);
	}

	@Override
	public List<ReviewDTO> getReviewListPage(String prd_board_id, long pg) throws Exception {
		// TODO Auto-generated method stub
		long startNum = (pg - 1) * pageSize + 1;
		long endNum   = pg * pageSize;
		
		return reviewDAO.getReviewListPage(prd_board_id, startNum, endNum);
	}
	
	@Override
	public ArrayList<ProductBoardDTO> getReviewListByInsdt(ProductCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListByInsdt(cri);
	}
	
	@Override
	public int getReviewListCount(String category) throws Exception{
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListCount(category);
	}
	
	@Override
	public ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListByInsdtCore(reviewcri);
	}
	
	@Override
	public int getReviewListCountCore(String prd_board_id) throws Exception{
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListCountCore(prd_board_id);
	}
	
//	@Override
//	public int getProductListCount(String category) throws Exception{
//		// TODO Auto-generated method stub
//		return productboardDAO.getProductListCount(category);
//	}
//
//	@Override
//	public ArrayList<ProductBoardDTO> getProductBoardListByInsdt(ProductCriteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return productboardDAO.getProductBoardListByInsdt(cri);
//	}
//
//	@Override
//	public ArrayList<ProductBoardDTO> getProductBoardListByHighPrice(ProductCriteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return productboardDAO.getProductBoardListByHighPrice(cri);
//	}
//
//	@Override
//	public ArrayList<ProductBoardDTO> getProductBoardListByRowPrice(ProductCriteria cri) throws Exception {
//		// TODO Auto-generated method stub
//		return productboardDAO.getProductBoardListByRowPrice(cri);
//	}

}
