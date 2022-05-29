package com.hmall.team04.dao.order;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.category.CategoryDTO;
import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;

public interface OrderDAO {
	ArrayList<OrderCompleteDTO> getOrderCompleteList(String user_id) throws SQLException;

	OrderCompleteDTO getPrdPayment(String user_id) throws SQLException;


}
