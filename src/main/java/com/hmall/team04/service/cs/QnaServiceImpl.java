package com.hmall.team04.service.cs;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.cs.QnaDAO;
import com.hmall.team04.dto.cs.QnaDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;
	
	public QnaServiceImpl(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}
	
	@Override
	public void insertQna(QnaDTO qnadto) throws Exception {
		qnaDAO.insertQna(qnadto);
	}

}
