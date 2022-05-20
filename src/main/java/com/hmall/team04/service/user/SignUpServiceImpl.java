package com.hmall.team04.service.user;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.user.SignUpDAO;
import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.dto.user.UserDTO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class SignUpServiceImpl implements SignUpService{
	
	final SignUpDAO signUpDAO;
	
	@Override
	public void signUp(SignUpRequestDTO signUpRequestDTO) throws Exception {
		
		// user_id 중복 검사
		Optional<UserDTO> foundUserId = signUpDAO.findByUserId(signUpRequestDTO.getUser_id());
        if (foundUserId.isPresent()) {
            throw new IllegalArgumentException("이미 존재하는 사용자 ID 입니다.");
        }
        
        // email 중복 검사
        Optional<UserDTO> foundEmail = signUpDAO.findByEmail(signUpRequestDTO.getEmail());
        if (foundEmail.isPresent()) {
            throw new IllegalArgumentException("이미 존재하는 Eamil 입니다.");
        }
        
        signUpDAO.insertUser(signUpRequestDTO);
        
        
	}

}
