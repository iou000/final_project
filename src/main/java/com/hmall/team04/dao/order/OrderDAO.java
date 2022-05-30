package com.hmall.team04.dao.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;

public interface OrderDAO {
	ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws SQLException;

	OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws SQLException;

	List<OrderDTO> getOrderByOrderNo(String orderNo) throws Exception;

}
