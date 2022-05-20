package com.hmall.team04.service.product;

import java.util.ArrayList;

import com.hmall.team04.dto.product.ProductBoardDTO;

public interface ProductBoardService {
	//
	ArrayList<ProductBoardDTO> getProductBoardList() throws Exception;

	ProductBoardDTO getProductBoard(String prd_board_id)  throws Exception;

}
