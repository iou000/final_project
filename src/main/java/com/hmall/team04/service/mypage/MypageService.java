package com.hmall.team04.service.mypage;

import java.util.List;

import com.hmall.team04.dto.mypage.MypageDTO;

public interface MypageService {

	List<MypageDTO> getPurchasePrd(String id, int day);

}
