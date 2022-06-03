package com.hmall.team04.dto.review;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	// review_t
	private String review_id;
	private String prd_board_id;
	private String prd_id;
	private String user_id;
	private String content;
	private int star;
	private Date ins_dt;
	private int file_yn;
}
