package com.hmall.team04.controller.order;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.deliever.DelieverDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.service.deliever.DelieverService;
import com.hmall.team04.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class OrderController {

	private final DelieverService delieverService;
	private final UserService userService;
	
	@RequestMapping(value = "/order", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HashMap<String, String> resultMap = new HashMap<String, String>();
		// ajax를 통해 넘어온 배열 데이터 선언
		String[] arrStr = req.getParameterValues("orderList");
		log.info(arrStr);
		
		// 현재 String 배열 안에 String이 있는 상태임, 이걸 ArrayList 형태로 전환
		ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
		if (arrStr != null && arrStr.length > 0) {
			for (int i = 0; i < arrStr.length; i++) {
				log.info(arrStr[i]);
				String[] subitem = arrStr[i].split(",");
				
//				OrderDTO orderDTO = new OrderDTO();
//				orderDTO.setPrd_board_id(subitem[0]);
//				orderDTO.setPrd_id(subitem[1]);
//				orderDTO.setOrdQty(Integer.parseInt(subitem[2]));
//				
//				log.info(orderDTO);
//				
//				orderList.add(orderDTO);
			}
		}
		// ArrayList 로 변환 완료
		log.info(orderList.toString());
		
		// 컨트롤러 간 공용 임시저장소인 session 을 불러와, orderInfo라는 key에 orderList를 value로 저장
		HttpSession session = req.getSession();
		session.setAttribute("orderInfo", orderList);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderSuccess", "True");

		return map;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(OrderDTO orderDTO, HttpServletRequest req, HttpServletResponse res, Model model, Principal principal) {
		String user_id = principal.getName();
		String user_nm = "";
		// ArrayList 자료형을 가짐
		// !!! 반드시 c:foreach 로 출력해야함 !!!
		HttpSession session = req.getSession();
		ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
		orderList = (ArrayList<OrderDTO>) session.getAttribute("orderInfo");
		log.info(orderList);
		
		DelieverDTO activeDeliever = null;
		try {
			activeDeliever = delieverService.selectDelieverActiveYnByUserId(user_id);
			user_nm = userService.getUserNamebyUserId(user_id);
			
			log.info("이이잉이ㅣ이이이이이이이이이이이이이이잉ㅇ"+activeDeliever);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user_nm", user_nm);
		model.addAttribute("activeDeliever", activeDeliever);
		model.addAttribute("orderInfo", orderList);
		// 우선 사용 완료했으므로 삭제하여 혹시모를 용량문제 해소
		session.removeAttribute("orderInfo");

		return "order.order";
	}
}