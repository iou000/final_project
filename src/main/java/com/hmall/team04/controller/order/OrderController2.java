package com.hmall.team04.controller.order;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.service.order.OrderService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController2 {
	
	@Autowired
	private OrderService orderService;
	
	//@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/orderComplete", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> orderComplete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 앞선 주문결제화면에서 유효한 거래라면 화면에서 데이터베이스로, 주문테이블, 주문상세테이블, 결제테이블들에 행이 Create된 상태이다.
		// 다만 여기서 문제는 '주문결제' 화면에서 데이터베이스로 단방향이라는 점이다. 중간에 븥잡을 곳은 컨트롤러간 임시저장소인 세션뿐이다.
		// 시큐리티 Princial을 활용하여 user_id를 이용하여 '가장 최신의' 그리고 '1개의' prd_order_id를 데이터베이스에서 주문완료화면으로 끌어와 Read할 수 있다.
		// 하지만, 매번 특정 사용자의 모든 주문내역을 살펴서 최근 1개를 뽑는 것보다, 세션에 방금 생성된 prd_order_id를 저장하고 이와 Principal에 저장된 user_id와 함께 사용하여 데이터를 찾는 게 효율적이다.
		// 왜냐하면 prd_order_id는 pk 설정하면서 인덱스를 설정하기 때문이다.
		
		// 주문결제화면에서 주문완료화면으로 넘어갈 때, 세션에 prd_board_id와 user_id가 저장되어있다는 것을 전제한다.
		// ajax를 통해 넘어온 배열 데이터 선언
		String[] arrStr = req.getParameterValues("orderCompleteList");
		log.info(arrStr);

		// 현재 String 배열 안에 String이 있는 상태임, 이걸 ArrayList 형태로 전환
		ArrayList<OrderCompleteDTO> orderCompleteList = new ArrayList<OrderCompleteDTO>();
		if (arrStr != null && arrStr.length > 0) {
			for (int i = 0; i < arrStr.length; i++) {
				log.info(arrStr[i]);
				String[] subitem = arrStr[i].split(",");
				
				OrderCompleteDTO orderCompleteDTO = new OrderCompleteDTO();
				orderCompleteDTO.setPrd_id(subitem[0]);
				orderCompleteDTO.setPrd_count(Integer.parseInt(subitem[1]));
				
				log.info(orderCompleteDTO);
				
				orderCompleteList.add(orderCompleteDTO);
			}
		}
		// ArrayList 로 변환 완료
		log.info(orderCompleteList.toString());
		
		// 컨트롤러 간 공용 임시저장소인 session 을 불러와, orderCompleteList라는 key에 orderCompleteList를 value로 저장
//		HttpSession session = req.getSession();
//		session.setAttribute("orderCompleteList", orderCompleteList);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderCompleteSuccess", "True");

		return map;
	}
	
	@RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	public String orderComplete(Principal principal,HttpServletRequest req, HttpServletResponse res, Model model) {
		try {
//			HttpSession session = req.getSession();
//			OrderCompleteDTO ordercompleteDTO = (OrderCompleteDTO) session.getAttribute("ordercompleteDTO");
			// 우선 사용 완료했으므로 삭제하여 혹시모를 용량문제 해소
//			session.removeAttribute("ordercompleteDTO");
			
			OrderCompleteDTO ordercompleteDTO = new OrderCompleteDTO();
			ordercompleteDTO.setUser_id("1");
			ordercompleteDTO.setPrd_order_id("merchant_1653809215425");
			ordercompleteDTO.setPrd_pmt_id("StdpayVBNKINIpayTest20220529162715283069");
			
			ArrayList<OrderCompleteDTO> ordercompleteList = orderService.getOrderCompleteList(ordercompleteDTO);
			log.info(ordercompleteList);

			OrderCompleteDTO orderpay = orderService.getPrdPayment(ordercompleteDTO);
			log.info(orderpay);
			
			// prd_order_id
			String prd_order_id = ordercompleteList.get(0).getPrd_order_id();
			
			// representative prd_id and check cnt of kind of item
			String prd_id = ordercompleteList.get(0).getPrd_id();
			
			// user_id
			String user_id = ordercompleteList.get(0).getUser_id();
			String address_dest = ordercompleteList.get(0).getAddress_dest();
			String hp_no = ordercompleteList.get(0).getHp_no();
			
			model.addAttribute("ordercompleteList", ordercompleteList);
			model.addAttribute("prd_order_id", prd_order_id);
			model.addAttribute("prd_id", prd_id);
			model.addAttribute("user_id", user_id);
			model.addAttribute("address_dest", address_dest);
			model.addAttribute("hp_no", hp_no);
			// pmt_amount, insert 될 때 총합으로 들어갈 것이므로, 여기선 그냥 빼오면 끝
			model.addAttribute("orderpay", orderpay);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		

		return "order.orderComplete";
	}
	
	@RequestMapping(value = "/orderPayComplete", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> orderPayComplete(OrderCompleteDTO ordercompleteDTO,Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 아임포트에서 ngrok을 통해 현재 localhost:8090/team04/orderPayComplete로 아래와 같이 전송
		//  curl -H "Content-Type: application/json" -X POST -d '{ "imp_uid": "imp_1234567890", "merchant_uid": "order_id_8237352", "status": "paid" }' { NotificationURL }
		log.info(ordercompleteDTO);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderPayComplete", "True");

		return map;
	}
	
	
}