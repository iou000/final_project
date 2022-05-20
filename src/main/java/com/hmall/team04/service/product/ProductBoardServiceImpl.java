package com.hmall.team04.service.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;

@Service
public class ProductBoardServiceImpl implements ProductBoardService {

	@Setter(onMethod_ = { @Autowired })
	private ProductBoardDAO productboardDAO;
	
	@Override
	public ArrayList<ProductBoardDTO> getProductBoardList() throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoardList();
	}

	@Override
	public ProductBoardDTO getProductBoard(String prd_board_id) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoard(prd_board_id);
	}


}
