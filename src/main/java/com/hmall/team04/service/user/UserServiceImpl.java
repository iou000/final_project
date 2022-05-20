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
	public UserDTO findIdbyNameEmail(String usernm, String email) {
		// TODO Auto-generated method stub
		return userDAO.findIdbyNameEmail(usernm, email);
	}

}
