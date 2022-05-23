package com.hmall.team04.controller.cart;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.service.cart.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "/odb/basktList.do", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> carttest(ProductBoardDTO productboardDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info(productboardDTO.toString());
		
		HttpSession session=req.getSession();
		
		session.setAttribute("productboardDTO", productboardDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cartSuccess", "True");
		
		return map;
	}
	
	@RequestMapping(value = "/odb/basktList.do", method= RequestMethod.GET)
	public String cart(HttpServletRequest req,HttpServletResponse res, Model model) {
		
		HttpSession session=req.getSession();
		ArrayList<CartDTO> cartList;
		
		try {
			cartList = cartService.getCartList("1");
			log.info(cartList.toString());
			
			model.addAttribute("cartList", cartList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "cart.cart";
	}
	
	@RequestMapping(value = "/odb/deletePrdCartId", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> deletePrdCartId(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info("deletePrdCartId "+cartDTO.toString());
		
		cartService.deletePrdCartId(cartDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("delete_PrdCartId_Success", "True");
		
		return map;
	}
}