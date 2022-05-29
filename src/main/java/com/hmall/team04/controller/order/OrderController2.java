package com.hmall.team04.controller.order;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.service.cart.CartService;
import com.hmall.team04.service.order.OrderService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController2 {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	public String order(Principal principal, Model model) {
		try {
//			ArrayList<OrderDTO> ordercompleteList = orderService.getOrderCompleteList(principal.getName());
			ArrayList<OrderCompleteDTO> ordercompleteList = orderService.getOrderCompleteList("1");
			log.info(ordercompleteList);

			OrderCompleteDTO ordercompleteDTO = orderService.getPrdPayment("1");
			log.info(ordercompleteDTO);
			
			// prd_order_id
			String prd_order_id = ordercompleteList.get(0).getPrd_order_id();
			
			// representative prd_id and check cnt of kind of item
			String prd_id = ordercompleteList.get(0).getPrd_id();
			
			// user_id
			String user_id = ordercompleteList.get(0).getUser_id();
			String address_dest = ordercompleteList.get(0).getAddress_dest();
			String hp_no = ordercompleteList.get(0).getHp_no();
			
			
			//model.addAttribute("ordercompleteList", ordercompleteList);
			model.addAttribute("prd_order_id", prd_order_id);
			model.addAttribute("prd_id", prd_id);
			model.addAttribute("user_id", user_id);
			model.addAttribute("address_dest", address_dest);
			model.addAttribute("hp_no", hp_no);
			// pmt_amount, insert 될 때 총합으로 들어갈 것이므로, 여기선 그냥 빼오면 끝
			model.addAttribute("ordercompleteDTO", ordercompleteDTO);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		

		return "order.orderComplete";
	}
}