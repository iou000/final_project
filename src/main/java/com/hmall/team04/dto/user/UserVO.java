package com.hmall.team04.dto.user;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String user_id;
	private String user_nm;
	private String password;
	private String email;
	private Date date;
	private String address_f;
	private String address_l;
	private String hp_no;
	private Date ins_dt;
	private Date upd_dt;
	
	private List<AuthVO> authList;
}
