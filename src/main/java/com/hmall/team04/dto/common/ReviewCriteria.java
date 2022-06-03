package com.hmall.team04.dto.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* 페이징 처리 클래스 */
@Getter
@Setter
@ToString
public class ReviewCriteria {
	private int pageNum;
	private int amount;
	
	private String prd_board_id;
	
	// 검색처리
	private String type;
	private String keyword;
	
	public ReviewCriteria(String prd_board_id) {
		this.pageNum = 1;
		this.amount = 10;
		this.prd_board_id = prd_board_id;
	}
	
	public ReviewCriteria(int pageNum, int amount, String prd_board_id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.prd_board_id = prd_board_id;
	}
	
	public ReviewCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] { } : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
	
		return builder.toUriString();
	}
	
}
