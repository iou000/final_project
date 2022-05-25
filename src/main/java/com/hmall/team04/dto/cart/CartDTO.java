package com.hmall.team04.dto.cart;

import lombok.Data;

@Data
public class CartDTO {
	private String prd_cart_id;
	private String user_id;
	private String prd_id;
	private int amount;
	
	// prd_t
	private String prd_nm;
	private int prd_price;
	private String prd_board_id;
	private String option1;
	private String option2;
	
	// file_t
	private String upload_path;
}
