package com.hmall.team04.service.cs;

import java.util.List;

import com.hmall.team04.dto.cs.NoticeDTO;


public interface NoticeService {
	
	List<NoticeDTO> getNoticeList() throws Exception;

	NoticeDTO getNoticeArticle(String articleid) throws Exception;
	
	List<NoticeDTO> getNoticeListFive() throws Exception;

}
