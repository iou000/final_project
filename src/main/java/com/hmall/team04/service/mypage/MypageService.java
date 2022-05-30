package com.hmall.team04.service.mypage;

import java.util.List;

import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderDTO;

public interface MypageService {

	List<OrderDTO> getPurchasePrd(String id, int day);

}
