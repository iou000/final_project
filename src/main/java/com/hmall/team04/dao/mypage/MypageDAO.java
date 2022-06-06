package com.hmall.team04.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

public interface MypageDAO {
	
	/* 마이페이지 최근 14일간 주문한 내역 */
	List<OrderDTO> getPurchasePrd(@Param("id") String id, @Param("day") int day) throws Exception;

	/*마이페이지 팝업(반품)*/
	List<OrderDetailDTO> getPopupDetailbyOrderDetailId(String detailid) throws Exception;

	void updateflagR(OrderDetailDTO orderdetaildto) throws Exception;

}
