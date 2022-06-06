package com.hmall.team04.service.mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.mypage.MypageDAO;

import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageServiceImpl implements MypageService{
	
	private MypageDAO mypageDAO;
	
	public MypageServiceImpl(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	
	
	@Override
	public List<OrderDTO> getPurchasePrd(String id, int day) throws Exception{
	
		return mypageDAO.getPurchasePrd(id , day);
	}


	@Override
	public List<OrderDetailDTO> getPopupDetailbyOrderDetailId(String detailid) throws Exception {
		
		return mypageDAO.getPopupDetailbyOrderDetailId(detailid);
	}
	
	@Override
	public void updateflagR(OrderDetailDTO orderdetaildto) throws Exception{
		mypageDAO.updateflagR(orderdetaildto);
	}


	@Override
	public int getCountStep1(String id) throws Exception {
		
		return mypageDAO.getCountStep1(id);
	}


	@Override
	public int getCountStep2(String id) throws Exception {
		return mypageDAO.getCountStep2(id);
	}


	@Override
	public int getCountStep3(String id) throws Exception {
	
		return mypageDAO.getCountStep3(id);
	}


	@Override
	public int getCountStep4(String id) throws Exception {
		
		return mypageDAO.getCountStep4(id);
	}


	@Override
	public int getCountStep5(String id) throws Exception {
		
		return mypageDAO.getCountStep5(id);
	}
	
	

}
