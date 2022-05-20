package com.hmall.team04.dao.user;

import java.util.Optional;

import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.dto.user.UserDTO;

public interface SignUpDAO {
	public Optional<UserDTO> findByUserId(String userId);
	public Optional<UserDTO> findByEmail(String email);
	public UserDTO insertUser(SignUpRequestDTO signUpRequestDTO);
}
