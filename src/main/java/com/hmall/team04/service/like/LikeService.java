package com.hmall.team04.service.like;

import com.hmall.team04.dto.like.LikeDTO;

public interface LikeService {

	int getLikeCnt(String prd_board_id) throws Exception;

	void InsertLike(LikeDTO likeDTO) throws Exception;

	int likeIsExist(String prd_board_id, String user_id) throws Exception;

	void DeleteLike(LikeDTO likeDTO) throws Exception;

}
