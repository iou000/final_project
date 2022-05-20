package com.hmall.team04.dao.cs;

import java.util.List;

import com.hmall.team04.dto.cs.FaqDTO;

public interface FaqDAO {
    /*고객센터 main 페이지에  자주 찾는 질문 10개 가져오는 함수*/
	List<FaqDTO> getfaqList() throws Exception;  
	
}
