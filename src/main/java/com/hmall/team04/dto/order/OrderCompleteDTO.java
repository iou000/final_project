package com.hmall.team04.dto.order;

import lombok.Data;

@Data
public class OrderCompleteDTO {
	// prd_order_t
	private String prd_order_id;
	private String user_id;
	private String address_dest;
	private String hp_no;
	private String order_date;
	
	// prd_orderdetail_t
	private int ordQty;
	private String prd_id;

	// prd_payment_t
	private int pmt_amount;
	
}
