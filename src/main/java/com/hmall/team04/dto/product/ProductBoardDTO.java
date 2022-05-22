package com.hmall.team04.dto.product;


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
	
	
}
