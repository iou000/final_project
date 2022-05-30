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
	
	// 배송지 리스트 조회
	@Override
	public List<DelieverDTO> selectDelieverListByUserId(String user_id) throws Exception {
		
		return delieverDAO.selectDelieverListByUserId(user_id);
	}
	
	// 배송지 추가
	@Override
	public DelieverDTO insertDeliever(DelieverDTO delieverDTO) throws Exception {
		
		return delieverDAO.insertDeliever(delieverDTO);
	}
	
	// 배송지 수정
	@Override
	public void updateDeliever(DelieverDTO delieverDTO) throws Exception{
		
		delieverDAO.updateDeliever(delieverDTO);
	}
	
	// 배송지 삭제
	@Override
	public void deleteDeliever(DelieverDTO delieverDTO) throws Exception {
		
		delieverDAO.deleteDeliever(delieverDTO);
		
	}

}
