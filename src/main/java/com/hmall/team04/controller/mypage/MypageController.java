package com.hmall.team04.controller.mypage;

import java.security.Principal;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.service.balance.BalanceService;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.order.OrderService;
import com.hmall.team04.service.reserve.ReserveService;
import com.hmall.team04.service.user.UserService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {
	
	private UserService userService;
	private CouponService couponService;
	private ReserveService reserveService;
	private BalanceService balanceService;
	private OrderService orderService;
 	
	public MypageController(UserService userService, CouponService couponService, ReserveService reserveService, BalanceService balanceService,
							OrderService orderService) {
		this.userService = userService;
		this.couponService = couponService;
		this.reserveService = reserveService;
		this.balanceService = balanceService;
		this.orderService = orderService;
	}
	
	@GetMapping("/odslist")
	public String odslist() {
		return "mypage.mypageODSList";
	}
	

	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/mymain") 
	public String mypage(Principal principal, Model model) {
		try {
			String usernm = userService.getUserNamebyUserId(principal.getName());
			int coupon_cnt = couponService.getCouponCountbyUserId(principal.getName());
			int reserves = reserveService.getReservebyUserId(principal.getName()); //적립금
			int balances = balanceService.getBalancebyUserId(principal.getName()); //예치금
			
			model.addAttribute("usernm",usernm);
			model.addAttribute("coupon_cnt",coupon_cnt);	
			model.addAttribute("reserves", reserves);
			model.addAttribute("balances", balances);
			return "mypage.mypageMainList";
		
			
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";
		}
	}
	
	
	@GetMapping("/crelist") 
	public String crelist() {
		return "mypage.mypageCREList";
	}
	
	@GetMapping("/od")
	public ModelAndView orderDetail(ModelAndView mnv, @RequestParam String orderNo) {
		try {
			mnv.setViewName("mypage.orderhist.orderdetail");
			List<OrderDTO> list = orderService.getOrderByOrderNo(orderNo);
			mnv.addObject("list", list);
		} catch (Exception e) {
			mnv.addObject("msg", "주문내역 출력 에러");
			mnv.addObject("url", "../");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
}
