package com.hmall.team04.controller.deliever;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmall.team04.dto.deliever.DelieverDTO;
import com.hmall.team04.service.deliever.DelieverService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/deliever")
public class DelieverController {
	
	private final DelieverService delieverService;
	
	
	@GetMapping("/selectDelieverList")
	public List<DelieverDTO> selectDelieverList( Principal principal) {
		
		log.info("배송지 정보 요청 유저 ID : "+principal.getName()); //getName()은 현재 User ID를 뜻함.
		String currentUserId = principal.getName();
		
		List<DelieverDTO> delieverList = null;
		
		try {
			delieverList = delieverService.selectDelieverListByUserId(currentUserId);
			return delieverList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return delieverList;
	}
	
	
	@PostMapping("/updateDeliever")
	public String updateDeliever(@ModelAttribute DelieverDTO delieverDTO, Principal principal) {
		log.info("배송지 업데이트 유저 ID : "+principal.getName());
		log.info(delieverDTO.toString());
		
		
		return delieverDTO.getDeliever_id();
	}
	
	@PostMapping("/insertDeliever")
	public String insertDeliever(@ModelAttribute DelieverDTO delieverDTO, Principal principal) {
		log.info("배송지 추가 유저 ID : "+principal.getName());
		log.info(delieverDTO.toString());
		
		
		return delieverDTO.getDeliever_id();
	}
	
	@PostMapping("/deleteDeliever")
	public String deleteDeliever(@ModelAttribute DelieverDTO delieverDTO, Principal principal) {
		log.info("배송지 삭제 유저 ID : "+principal.getName());
		log.info(delieverDTO.toString());
		
		
		return delieverDTO.getDeliever_id();
	}
	
	
	
}
