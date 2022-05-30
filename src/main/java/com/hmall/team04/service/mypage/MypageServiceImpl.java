package com.hmall.team04.service.mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.mypage.MypageDAO;

import com.hmall.team04.dto.order.OrderDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageServiceImpl implements MypageService{
	
	private MypageDAO mypageDAO;
	
	public MypageServiceImpl(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	
	
	@Override
	public List<OrderDTO> getPurchasePrd(String id, int day) {
	
		return mypageDAO.getPurchasePrd(id , day);
	}
	
	

}
