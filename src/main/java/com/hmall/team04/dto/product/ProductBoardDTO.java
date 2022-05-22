package com.hmall.team04.dto.product;


import java.util.Date;

import lombok.Data;

@Data
public class ProductBoardDTO {
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
	private String option1;
	private String option2;
	
	// file_t
	private String upload_path;
	
	// review_t
	private String review_id;
	private String review_content;
	private String user_id;
	private int star;
	private Date ins_dt;
}
