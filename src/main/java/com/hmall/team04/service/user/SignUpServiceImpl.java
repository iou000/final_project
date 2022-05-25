package com.hmall.team04.service.user;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.user.SignUpDAO;
import com.hmall.team04.dto.user.SignUpRequestDTO;
import com.hmall.team04.exception.AlreadyExistingEmailException;
import com.hmall.team04.exception.AlreadyExistingUserIdException;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@RequiredArgsConstructor
public class SignUpServiceImpl implements SignUpService{
	
	private final SignUpDAO signUpDAO;
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public void signUp(SignUpRequestDTO signUpRequestDTO) throws Exception {
		
		// user_id 중복 검사
		String foundUserId = signUpDAO.checkUserIdYn(signUpRequestDTO.getUser_id());
		log.info("서비스단 : "+ foundUserId);
		
        if (foundUserId.equals("Y")) {
        	throw new AlreadyExistingUserIdException("이미 존재하는 사용자 ID : "+ signUpRequestDTO.getUser_id());
        }
        
        // email 중복 검사
        String foundEmail = signUpDAO.checkUserEmailYn(signUpRequestDTO.getEmail());
        if (foundEmail.equals("Y")) {
        	throw new AlreadyExistingEmailException("이미 존재하는 사용자 Eamil : "+ signUpRequestDTO.getEmail());
        }
        
        signUpRequestDTO.setPassword(passwordEncoder.encode(signUpRequestDTO.getPassword()));
        
        // 권한 추가
        if (signUpRequestDTO.getAuth() == null) {
        	signUpRequestDTO.setAuth("ROLE_USER");
        	log.info("권한 추가 : "+signUpRequestDTO.getAuth());
        }
        
        try {
        	signUpDAO.insertUser(signUpRequestDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
	}
	
	// user_id 중복 검사
	@Override
	public String checkIdDup(String userId) throws Exception {
		
		return signUpDAO.checkUserIdYn(userId); // userId가 존재하면 Y, 존재하지 않으면 N 리턴.
	}
	
	// email 중복 검사
	@Override
	public String checkEmailDup(String email) throws Exception {
		
		return signUpDAO.checkUserEmailYn(email); // email이 존재하면 Y, 존재하지 않으면 N 리턴.;
	}

}
