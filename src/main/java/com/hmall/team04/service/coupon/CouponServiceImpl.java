package com.hmall.team04.service.coupon;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.coupon.CouponDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CouponServiceImpl implements CouponService{
	
	private CouponDAO couponDAO;
	
	public CouponServiceImpl(CouponDAO couponDAO) {
		this.couponDAO = couponDAO;
	}
	
	/* 마이페이지 보유쿠폰 */
	@Override
	public int getCouponCountbyUserId(String userid) throws Exception {
		
		return couponDAO.getCouponCountbyUserId(userid);
	}
	
}
