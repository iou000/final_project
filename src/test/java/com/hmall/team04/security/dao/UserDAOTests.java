package com.hmall.team04.security.dao;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.user.UserDAO;
import com.hmall.team04.dto.user.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private UserDAO userDAO;
	
	@Test
	public void testRead() {
		
		UserVO vo = userDAO.selectUserInfo("1");
		
		log.info(vo);
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
	}
	
}
