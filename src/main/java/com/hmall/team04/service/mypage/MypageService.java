package com.hmall.team04.service.mypage;

import java.util.List;

import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

public interface MypageService {

	List<OrderDTO> getPurchasePrd(String id, int day) throws Exception;

	List<OrderDetailDTO> getPopupDetailbyOrderDetailId(String detailid) throws Exception;

	void updateflagR(OrderDetailDTO orderdetaildto) throws Exception;

	int getCountStep1(String id) throws Exception; 

	int getCountStep2(String id) throws Exception;
	
	int getCountStep3(String id) throws Exception;
	
	int getCountStep4(String id) throws Exception;
	
	int getCountStep5(String id) throws Exception;

}
