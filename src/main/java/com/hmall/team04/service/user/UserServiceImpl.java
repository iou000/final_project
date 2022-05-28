package com.hmall.team04.service.user;


import org.springframework.stereotype.Service;

import com.hmall.team04.dao.user.UserDAO;
import com.hmall.team04.dto.user.UserDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	private UserDAO userDAO;
	
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public UserDTO findIdbyNameEmail(String usernm, String email) throws Exception {
		// TODO Auto-generated method stub
		UserDTO userDTO = userDAO.findIdbyNameEmail(usernm, email);
		if(userDTO == null) {
			log.info("id 혹은 이메일이 존재하지 않습니다");
			throw new Exception("id 혹은 이메일이 존재하지 않습니다");
		}
		return userDTO;
	}

	@Override
	public int findPwd(String id, String email, String pno) throws Exception {
		// TODO Auto-generated method stub
		log.info("--------------test-------------" + email);
		return userDAO.findPwd(id, email, pno);
	}

	@Override
	public String getUserNamebyUserId(String userid) throws Exception {
			return userDAO.getUserNamebyUserId(userid);
	}

}
