package com.hmall.team04.service.cart;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.cart.CartDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	
	
	@Setter(onMethod_ = { @Autowired })
	private CartDAO cartDAO;
	

	@Override
	public ArrayList<CartDTO> getCartList(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.getCartList(user_id);
	}


	@Override
	public void deletePrdCartId(CartDTO cartDTO) throws Exception {
		// TODO Auto-generated method stub
		cartDAO.deleteCart(cartDTO);
	}


}
