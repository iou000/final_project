package com.hmall.team04.controller.mypage;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.QnaDTO;
import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderCancelDTO;
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
	public String odslist(Principal principal,Model model) {
		try {
			String id = principal.getName(); // user_id;			
			int cnt_step1 = mypageService.getCountStep1(id);
			int cnt_step2 = mypageService.getCountStep2(id);
			int cnt_step3 = mypageService.getCountStep3(id);
			int cnt_step4 = mypageService.getCountStep4(id);
			int cnt_step5 = mypageService.getCountStep5(id);
			model.addAttribute("cnt_step1", cnt_step1);
			model.addAttribute("cnt_step2", cnt_step2);
			model.addAttribute("cnt_step3", cnt_step3);
			model.addAttribute("cnt_step4", cnt_step4);
			model.addAttribute("cnt_step5", cnt_step5);			
			return "mypage.orderhist.mypageODSList";
		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";			
		}		
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
	public ModelAndView orderDetail(Principal principal, @RequestParam String orderNo) {
		ModelAndView mnv = new ModelAndView();
		try {
			mnv.setViewName("mypage.orderhist.orderdetail");
			OrderDTO orderDTO = orderService.getOrderByOrderNo(principal.getName(), orderNo);
			log.info(orderDTO);
			mnv.addObject("orderDTO", orderDTO);
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "주문내역 출력 에러");
			mnv.addObject("url", "");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
	
	@GetMapping("/oc")
	public ModelAndView orderCancelDetail(Principal principal, @RequestParam String orderDetailNo, @RequestParam String orderNo) {
		ModelAndView mnv = new ModelAndView();
		try {
			mnv.setViewName("mypage.orderhist.ordercancel");
			OrderDetailDTO odDTO = orderService.getOrderDetail(principal.getName(), orderDetailNo);
			OrderDTO oDTO = orderService.getOrderByOrderNo(principal.getName(), orderNo);
			mnv.addObject("odDTO", odDTO);
			mnv.addObject("oDTO", oDTO);
			mnv.addObject("orderNo", orderNo);
			mnv.addObject("orderDetailNo", orderDetailNo);
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "주문취소 출력 에러");
			mnv.addObject("url", "");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
	
	@PostMapping("/oc")
	@ResponseBody
	public ResponseEntity<Void> cancelOrder(@RequestBody HashMap<String, Object> param, Principal principal) {
//		int returnPrice = Integer.parseInt(((String) param.get(0).get("returnPrice")).replaceAll("[^0-9]",""));
//		int returnPoint = Integer.parseInt(((String) param.get(1).get("returnPoint")).replaceAll("[^0-9]",""));
		int updtTotal = Integer.valueOf((String) param.get("updtTotal"));
		int updtDis = Integer.valueOf((String) param.get("updtDis"));
		int updtPmt = Integer.valueOf((String) param.get("updtPmt"));
		int updtRDA = Integer.valueOf((String) param.get("updtRDA"));
		int updtCDA = Integer.valueOf((String) param.get("updtCDA"));
		int updtPC = Integer.valueOf((String) param.get("updtPC"));
		String updtFlag = String.valueOf(param.get("updtFlag"));
		String orderId = String.valueOf(param.get("orderId"));
		String oDetailId = String.valueOf(param.get("oDetailId"));
		log.info("param : " + param);
		try {
			orderService.updateCancelInfo(updtTotal, updtDis, updtPmt, updtRDA, updtCDA, updtPC, updtFlag, orderId, oDetailId, principal.getName());
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e);
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
