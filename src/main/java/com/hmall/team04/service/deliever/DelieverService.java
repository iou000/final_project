package com.hmall.team04.service.deliever;

import java.util.List;

import com.hmall.team04.dto.deliever.DelieverDTO;

public interface DelieverService {

	List<DelieverDTO> selectDelieverListByUserId(String userId) throws Exception;

}
