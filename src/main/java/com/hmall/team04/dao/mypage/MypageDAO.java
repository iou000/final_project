package com.hmall.team04.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.mypage.MypageDTO;

public interface MypageDAO {
	
	/* 마이페이지 최근 14일간 주문한 내역 */
	List<MypageDTO> getPurchasePrd(@Param("id")String id, @Param("day") int day);

}
