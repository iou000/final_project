package com.hmall.team04.service.user;

import com.hmall.team04.dto.user.SignUpRequestDTO;

public interface SignUpService {
	
	void signUp(SignUpRequestDTO signUpRequestDTO) throws Exception;

}
