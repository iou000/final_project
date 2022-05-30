package com.hmall.team04.service.order;

import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;

public interface OrderService {
	//
	ArrayList<OrderCompleteDTO> getOrderCompleteList(String user_id) throws Exception;

	OrderCompleteDTO getPrdPayment(String user_id) throws Exception;

	List<OrderDTO> getOrderByOrderNo(String orderNo) throws Exception;

}
