package com.hmall.team04.controller.order;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.order.OrderDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController2 {

	@RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	public String order(OrderDTO orderDTO, HttpServletRequest req, HttpServletResponse res, Model model) {

		HttpSession session = req.getSession();
		ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		log.info(orderList);
		
		model.addAttribute("orderInfo", orderList);
		session.removeAttribute("orderInfo");

		return "order.orderComplete";
	}
}