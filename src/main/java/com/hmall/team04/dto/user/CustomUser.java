package com.hmall.team04.dto.user;

import java.util.Collection;

import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	private UserVO user;
	
	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	public CustomUser(UserVO vo) {
		super(vo.getUser_id(), vo.getPassword(), vo.getAuthList()
													.stream()
													.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.user = vo;
	}

}
