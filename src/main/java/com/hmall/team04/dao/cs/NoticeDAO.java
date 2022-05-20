package com.hmall.team04.dao.cs;

import java.util.List;

import com.hmall.team04.dto.cs.NoticeDTO;

public interface NoticeDAO {
	
	List<NoticeDTO> getNoticeList() throws Exception;

	NoticeDTO getNoticeArticle(String articleid) throws Exception;

}
