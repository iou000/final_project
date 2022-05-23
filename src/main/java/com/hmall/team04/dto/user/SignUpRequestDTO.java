package com.hmall.team04.dto.user;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SignUpRequestDTO {
	
	
	//@NotEmpty(message="아이디를 입력해주세요.")
	@Pattern(regexp="\\w{6,12}", message="아이디를 6~12자로 입력해주세요.")
	private String user_id;
	
	//@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="이메일 형식에 맞춰 올바르게 입력해주세요.")
	private String email;
	
    @Size(min=6, max=12, message="비밀번호를 6~12자로 입력해주세요.")
	private String password;
	
    @Size(min=6, max=12, message="비밀번호를 6~12자로 입력해주세요.")
	private String check_password;
	
	//@NotEmpty(message="비밀번호를 입력해주세요.")
	@Pattern(regexp="\\S{2,8}", message="이름을 2~8자로 입력해주세요.")
	private String user_nm;
	
	private String gender;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	@NotEmpty(message = "우편번호를 입력해주세요.")
	private String address_f;
	
	@NotEmpty(message = "주소를 입력해주세요.")
	private String address_l;
	
	//@NotEmpty(message="휴대폰 번호를 입력해주세요.")
	@Pattern(regexp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message = "휴대폰 번호 형식을 올바르게 입력해 주세요.")
	private String hp_no;
	
	private String auth;
	
	public boolean isPwEqualToCheckPw() {
        return password.equals(check_password);
    }
}
