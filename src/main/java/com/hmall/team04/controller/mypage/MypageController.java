package com.hmall.team04.controller.mypage;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.QnaDTO;
import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;
import com.hmall.team04.service.balance.BalanceService;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.cs.QnaService;
import com.hmall.team04.service.mypage.MypageService;
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
	private MypageService mypageService;
	private QnaService qnaService;
 	
	public MypageController(UserService userService, CouponService couponService, ReserveService reserveService, BalanceService balanceService,
							OrderService orderService, MypageService mypageService, QnaService qnaService ) {
		this.userService = userService;
		this.couponService = couponService;
		this.reserveService = reserveService;
		this.balanceService = balanceService;
		this.orderService = orderService;
		this.mypageService = mypageService;
		this.qnaService = qnaService;
	}
	
	@GetMapping("/odslist")
	public String odslist() {
		return "mypage.orderhist.mypageODSList";
	}
	

	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/mymain") 
	public String mypage(Principal principal, Model model, Criteria cri) {
		try {
			String id = principal.getName();
			String usernm = userService.getUserNamebyUserId(id);
			int coupon_cnt = couponService.getCouponCountbyUserId(id);
			int reserves = reserveService.getReservebyUserId(id); //적립금
			int balances = balanceService.getBalancebyUserId(id); //예치금
			List<OrderDTO> list = mypageService.getPurchasePrd(id,14); //최근주문내역(최근14일)			
			List<QnaDTO> qlist = qnaService.getQnaListFive(id); //최근문의내역
			model.addAttribute("qlist",qlist);
			model.addAttribute("list",list);
			model.addAttribute("usernm",usernm);
			model.addAttribute("coupon_cnt",coupon_cnt);	
			model.addAttribute("reserves", reserves);
			model.addAttribute("balances", balances);
			return "mypage.orderhist.mypageMainList";			
		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";
		}
	}
	
	
	@GetMapping("/returnPopup") 
	public String returnpop(@RequestParam("detailid") String detailid, Model model) {
		try {
			List<OrderDetailDTO> list = mypageService.getPopupDetailbyOrderDetailId(detailid);
			model.addAttribute("list",list); //row한줄 list[0].
			return "mypagePopup/returnPopup";
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";
		}	
	}
	@GetMapping("/exchangePopup") 
	public String exchangepop(@RequestParam("detailid") String detailid, Model model) {
		try {
			List<OrderDetailDTO> list = mypageService.getPopupDetailbyOrderDetailId(detailid);
			model.addAttribute("list",list); //row한줄 list[0].
			return "mypagePopup/exchangePopup";
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";
		}	
	}
	
	
	
	@RequestMapping(value = "/flagUpdateR", method=RequestMethod.POST)
	@ResponseBody
	public String updateFlag(@RequestBody OrderDetailDTO orderdetaildto) {		
		try {	
			mypageService.updateflagR(orderdetaildto);
			return "success";
			
		} catch (Exception e) {
			log.info(e);
			return "fail";
		}					
	}
	
	
	@RequestMapping(value = "/flagUpdateE", method=RequestMethod.POST)
	@ResponseBody
	public String updateFlagE(@RequestBody OrderDetailDTO orderdetaildto) {				
		try {	
			mypageService.updateflagR(orderdetaildto);
			return "success";
			
		} catch (Exception e) {
			log.info(e);
			return "fail";
		}				
	}
	
	
	@GetMapping("/crelist") 
	public String crelist() {
		return "mypage.orderhist.mypageCREList";
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
