package com.hmall.team04.dao.deliever;

import java.util.List;

import com.hmall.team04.dto.deliever.DelieverDTO;

public interface DelieverDAO {

	List<DelieverDTO> selectDelieverListByUserId(String userId) throws Exception;

}
