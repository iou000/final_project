package com.hmall.team04.dto.review;

import java.util.List;

import com.hmall.team04.dto.common.PageDTO;

import lombok.Data;

@Data
public class ReviewPageDTO {
	List<ReviewDTO> list;
	PageDTO pageInfo;
}
