package com.hmall.team04.dao.user;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.user.UserDTO;

public interface UserDAO {
	public UserDTO selectUserInfo(String userid);

	public UserDTO findIdbyNameEmail(@Param("usernm") String usernm, @Param("email") String email) throws Exception;

	public int findPwd(@Param("user_id") String id, @Param("email") String email, @Param("hp_no") String pno) throws Exception;
	
}
