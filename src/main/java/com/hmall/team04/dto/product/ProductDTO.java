package com.hmall.team04.dto.product;

import lombok.Data;

@Data
public class ProductDTO {
	private int cate_id;
	private String g_id;
	
	private int cate_lev;
	private String cate_nm;

	private int cate_detail_lev;
	private String cate_detail_nm;
	
	private int cate_parent_lev;
	private int cate_detail_parent_lev;	
}
