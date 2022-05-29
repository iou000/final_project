package com.hmall.team04.dto.order;

import lombok.Data;

@Data
public class OrderDTO {
	// prd_order_t
	private String prd_order_id;
	private String user_id;
	
	// prd_orderdetail_t
	private long ordQty;
	
	private String prd_board_id;
	private int discount_rate;
	private int price;
	private String title;
	private String content;
	private int score;
	private String category;
	private String brand;
	
	// prd_t 
	private String prd_id;
	private String prd_nm;
	private String prd_detail;
	private String option1;
	private String option2;
	
	// file_t
	private String upload_path;
}
