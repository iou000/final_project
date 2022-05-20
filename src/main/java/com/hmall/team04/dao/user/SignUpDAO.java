package com.hmall.team04.dao.user;

import java.util.Optional;

import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.dto.user.UserVO;

public interface SignUpDAO {
	public Optional<UserVO> findByUserId(String userId);
	public Optional<UserVO> findByEmail(String email);
	public UserVO insertUser(SignUpRequestDTO signUpRequestDTO);
}
