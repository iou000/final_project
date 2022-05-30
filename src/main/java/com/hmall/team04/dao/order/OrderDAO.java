package com.hmall.team04.dao.order;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.order.OrderCompleteDTO;

public interface OrderDAO {
	ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws SQLException;

	OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws SQLException;


}
