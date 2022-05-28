package com.hmall.team04.security.dao;


import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.balance.BalanceDAO;
import com.hmall.team04.dao.coupon.CouponDAO;
import com.hmall.team04.dao.reserve.ReserveDAO;
import com.hmall.team04.dao.user.UserDAO;
import com.hmall.team04.dto.user.UserDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class UserDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	
	private UserDAO userDAO;
	
	@Setter(onMethod_ = @Autowired)
	private CouponDAO couponDAO;
	
	@Setter(onMethod_ = @Autowired)
	private ReserveDAO reserveDAO;
	
	@Setter(onMethod_ = @Autowired)
	private BalanceDAO balanceDAO;
	
	@Autowired
    BCryptPasswordEncoder passwordEncoder;
	
	
	@Test
	@Ignore
	public void testEncodePwd() {
		String rawPassword = "12345678!A";                //인코딩 전 메서드
        String encdoePassword1;                        // 인코딩된 메서드
        String encdoePassword2;                        // 똑같은 비밀번호 데이터를 encdoe()메서드를 사용했을 때 동일한 인코딩된 값이 나오는지 확인하기 위해 추가
        
        encdoePassword1 = passwordEncoder.encode(rawPassword);
        encdoePassword2 = passwordEncoder.encode(rawPassword);
        
        // 인코딩된 패스워드 출력
        System.out.println("encdoePassword1 : " +encdoePassword1);
        System.out.println(" encdoePassword2 : " + encdoePassword2);
        
        String truePassowrd = "12345678!A";
        String falsePassword = "asdfjlasf";
        
        System.out.println("truePassword verify : " + passwordEncoder.matches(truePassowrd, encdoePassword1));
        System.out.println("falsePassword verify : " + passwordEncoder.matches(falsePassword, encdoePassword1));    
        
	}
	
	@Test
	@Ignore
	public void testRead() {
		
		UserDTO vo = userDAO.selectUserInfo("1");
		
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
	}
	
	@Test
	public void testID() {
		try {
		
			log.info(balanceDAO.getBalancebyUserId("1"));
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	
	
}
