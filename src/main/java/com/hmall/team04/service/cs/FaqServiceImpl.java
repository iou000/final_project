package com.hmall.team04.service.cs;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.cs.FaqDAO;
import com.hmall.team04.dto.cs.FaqDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FaqServiceImpl implements FaqService{
	
	private FaqDAO faqDAO;
	
	public FaqServiceImpl(FaqDAO faqDAO) {
		this.faqDAO = faqDAO;
	}
	@Override
	 /*고객센터 main 페이지에  자주 찾는 질문 10개 가져오는 함수*/
	public List<FaqDTO> getfaqList() throws Exception {
		
		return faqDAO.getfaqList();
	}

}
