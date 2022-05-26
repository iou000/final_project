package com.hmall.team04.controller.order;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.order.OrderDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController {

	@RequestMapping(value = "/order", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(OrderDTO orderDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info("hi i am oda order.do");
		log.info(orderDTO.toString());
		
		HttpSession session=req.getSession();
		
		session.setAttribute("orderInfo", orderDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("orderSuccess", "True");
		
		return map;
	}
	
	@RequestMapping(value = "/order", method= RequestMethod.GET)
	public String order(OrderDTO orderDTO, HttpServletRequest req,HttpServletResponse res,Model model) {
		
		HttpSession session=req.getSession();
		
		model.addAttribute("orderInfo", session.getAttribute("orderInfo"));
		// 우선 사용 완료했으므로 삭제
		session.removeAttribute("orderInfo");
		
		return "order.order";
	}
}