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

	@RequestMapping(value = "/order2", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
	   // ajax를 통해 넘어온 배열 데이터 선언
	   String[] arrStr = req.getParameterValues("orderList");
	   log.info(arrStr);
	   
	   try {
	       if(arrStr !=null && arrStr.length > 0) {
	            for(int i=0; i<arrStr.length; i++) {
	               System.out.println("ajax traditional result : " + i +" : "+ arrStr[i]);
	       	    }
	       	    resultMap.put("result", "success");
	       	} else {
	      	    resultMap.put("result", "false");
	      	}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return resultMap;
		
		
//		HttpSession session=req.getSession();
//		
//		session.setAttribute("orderInfo", orderDTO);
//		
//		HashMap<String,String> map = new HashMap<String,String>();
//		map.put("orderSuccess", "True");
//		
//		return map;
	}
}