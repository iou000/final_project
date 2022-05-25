package com.hmall.team04.dao.cs;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.QnaDTO;

public interface QnaDAO {

	void insertQna(QnaDTO qnadto) throws Exception;
	
	int getBoardCount(@Param("userid") String userid, Criteria cri) throws Exception;

	List<QnaDTO> getQnaList(String userid, Criteria cri) throws Exception;
}
