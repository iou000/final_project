package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductBoardDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductBoardDAO productboardDAO;
	
	@Test
	public void testGetProductBoardList() {
		
		ArrayList<ProductBoardDTO> list;
		try {
			list = productboardDAO.getProductBoardList();
			
			for(int i=0;i<list.size();i++) {
				log.info(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testGetProductBoard() {
		
		ProductBoardDTO productboardDTO;
		try {
			productboardDTO = productboardDAO.getProductBoard("prd_board_id_tmp1");
			
			System.out.println(productboardDTO.toString());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
