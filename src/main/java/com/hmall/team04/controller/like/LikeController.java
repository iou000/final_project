package com.hmall.team04.controller.like;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.service.like.LikeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value = "/insertLike", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> Like(LikeDTO likeDTO, Principal principal) throws Exception {
		
		log.info(likeDTO.toString());

		if(principal == null) {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("needLogin", "True");
			return map;
		} else {
			
			log.info(principal.getName());
			likeDTO.setUser_id(principal.getName());
			log.info(likeDTO);
			likeService.InsertLike(likeDTO);
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("likeSuccess", "True");
			
			return map;	
		}
	}
	
	@RequestMapping(value = "/deleteLike", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> deletePrdCartId(LikeDTO likeDTO, Principal principal) throws Exception {
		
		// 언제나 로그인 이후에만 이 컨트롤러로 다가옴
		likeDTO.setUser_id(principal.getName());
		log.info(likeDTO);
		likeService.DeleteLike(likeDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("delete_like_Success", "True");
		
		return map;
	}		
//	
//	@PreAuthorize("isAuthenticated()")
//	@RequestMapping(value = "/basktList", method= RequestMethod.GET)
//	public String cart(HttpServletRequest req,HttpServletResponse res, Model model, Principal principal) {
//		
//		HttpSession session=req.getSession();
//		ArrayList<CartDTO> cartList;
//		
//		log.info(session.getAttribute("id"));
//		log.info(principal.getName());
//		
//		try {
//			cartList = cartService.getCartList(principal.getName());
//			log.info(cartList.toString());
//			
//			model.addAttribute("cartList", cartList);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		
//		return "cart.cart";
//	}
//	
//	
//	@RequestMapping(value = "/updatePrdCartQty", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public HashMap<String, String> updatePrdCartQty(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
//		
//		log.info("updatePrdCartQty "+cartDTO.toString());
//		
//		cartService.updatePrdCartQty(cartDTO);
//		
//		HashMap<String,String> map = new HashMap<String,String>();
//		map.put("update_PrdCartQty_Success", "True");
//		
//		return map;
//	}
}