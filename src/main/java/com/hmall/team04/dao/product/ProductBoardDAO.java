package com.hmall.team04.dao.product;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.product.ProductBoardDTO;

public interface ProductBoardDAO {
	//
	ArrayList<ProductBoardDTO> getProductBoardList() throws SQLException;

	// 상품 게시판 선택 시 해당 게시판 표시 메소드 ; 게시판이 가지고잇는 게시글들이 상품1개에 상응한다.
	ProductBoardDTO getProductBoard(String prd_board_id) throws SQLException;
}
