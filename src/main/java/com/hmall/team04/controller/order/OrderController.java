package com.hmall.team04.controller.order;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.coupon.CouponDTO;
import com.hmall.team04.dto.deliever.DelieverDTO;

import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderPrdRequestDTO;
import com.hmall.team04.dto.order.OrderPrdResponseDTO;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.deliever.DelieverService;
import com.hmall.team04.service.order.OrderService;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.product.ProductService;
import com.hmall.team04.service.reserve.ReserveService;
import com.hmall.team04.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class OrderController {

	private final DelieverService delieverService;
	private final UserService userService;
	private final CouponService couponService;
	private final ReserveService reserveService;
	private final ProductService productService;
	private final OrderService orderService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/order", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(@RequestBody List<OrderPrdRequestDTO> orderPrdList, HttpServletRequest req, HttpServletResponse res) throws Exception {

		HashMap<String, String> resultMap = new HashMap<String, String>();
		
		// ArrayList 로 변환 완료
		log.info(orderPrdList.toString());
		
		// 컨트롤러 간 공용 임시저장소인 session 을 불러와, orderInfo라는 key에 orderList를 value로 저장
		HttpSession session = req.getSession();
		session.setAttribute("orderInfo", orderPrdList);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderSuccess", "True");

		return map;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(HttpServletRequest req, HttpServletResponse res, Model model, Principal principal) {
		String user_id = principal.getName();
		String user_nm = "";
    
		// ArrayList 자료형을 가짐
		// !!! 반드시 c:foreach 로 출력해야함 !!!
		HttpSession session = req.getSession();
		List<OrderPrdRequestDTO> orderPrdRequestList = new ArrayList<>();
		orderPrdRequestList = (ArrayList<OrderPrdRequestDTO>) session.getAttribute("orderInfo");

		log.info("================================"+orderPrdRequestList.toString());
		
		List<OrderPrdResponseDTO> orderPrdList = new ArrayList<>();
		DelieverDTO activeDeliever = null;
		CouponDTO top1Coupon = null;
		int user_reserve = 0;
		
		try {
			
			for(OrderPrdRequestDTO dto : orderPrdRequestList) { //주문서에 들어갈 상품(리스트)
				OrderPrdResponseDTO orderPrd = productService.getOrderProductByPrdId(dto.getPrd_id());
				orderPrd.setPrd_count(dto.getPrd_count());
				orderPrd.setPrd_price(orderPrd.getPrd_price() * dto.getPrd_count());
				
				orderPrdList.add(orderPrd);
			}
			
			activeDeliever = delieverService.selectDelieverActiveYnByUserId(user_id);
			user_nm = userService.getUserNamebyUserId(user_id);
			top1Coupon = couponService.selectCouponTop1ByUserId(user_id);
			user_reserve = reserveService.getReservebyUserId(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user_nm", user_nm);
		model.addAttribute("activeDeliever", activeDeliever);
		model.addAttribute("top1Coupon", top1Coupon);
		model.addAttribute("user_reserve", user_reserve);
		model.addAttribute("prd_board_id", orderPrdRequestList.get(0).getPrd_board_id());
		model.addAttribute("orderPrdList", orderPrdList);
		// 우선 사용 완료했으므로 삭제하여 혹시모를 용량문제 해소
		//session.removeAttribute("orderInfo");

		return "order.order";
	}
	
	
	
	
	@RequestMapping(value = "/orderComplete", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void orderComplete2(@RequestBody List<OrderCompleteDTO> orderCompleteList, Principal principal) {
			
		for(OrderCompleteDTO ordercompleteDTO : orderCompleteList) {
			log.info(ordercompleteDTO.toString());
		}
		
			
			
			
			
	}
	
	@RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	public String orderComplete(OrderCompleteDTO orderCompleteDTO, Principal principal,HttpServletRequest req, HttpServletResponse res, Model model) {
		try {
			// HttpSession session = req.getSession();
			// OrderCompleteDTO ordercompleteDTO = (OrderCompleteDTO) session.getAttribute("ordercompleteDTO");
			// 우선 사용 완료했으므로 삭제하여 혹시모를 용량문제 해소
			// session.removeAttribute("ordercompleteDTO");
			
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