package com.hmall.team04.service.order;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.controller.cart.CartController;
import com.hmall.team04.dao.cart.CartDAO;
import com.hmall.team04.dao.order.OrderDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {
	
	
	@Setter(onMethod_ = { @Autowired })
	private OrderDAO orderDAO;

	@Override
	public ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.getOrderCompleteList(ordercompleteDTO);
	}

	@Override
	public OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.getPrdPayment(ordercompleteDTO);
	}


}
