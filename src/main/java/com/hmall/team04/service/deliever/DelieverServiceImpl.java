package com.hmall.team04.service.deliever;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.deliever.DelieverDAO;
import com.hmall.team04.dto.deliever.DelieverDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class DelieverServiceImpl implements DelieverService {
	
	private final DelieverDAO delieverDAO;
	
	@Override
	public List<DelieverDTO> selectDelieverListByUserId(String userId) throws Exception {
		
		return delieverDAO.selectDelieverListByUserId(userId) ;
	}

}
