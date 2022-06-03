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
	private String prd_id;
	private int prd_count;

	// prd_payment_t
	private String prd_pmt_id;
	private int pmt_amount;
	private String pay_status;
}
