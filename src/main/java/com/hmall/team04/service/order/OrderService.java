package com.hmall.team04.service.order;

import java.util.ArrayList;

import com.hmall.team04.dto.order.OrderCompleteDTO;

public interface OrderService {
	//
	ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws Exception;

	OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws Exception;


}
