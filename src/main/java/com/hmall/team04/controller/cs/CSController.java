package com.hmall.team04.controller.cs;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmall.team04.dto.cs.NoticeDTO;
import com.hmall.team04.service.cs.NoticeService;

import com.hmall.team04.dto.cs.FaqDTO;
import com.hmall.team04.service.cs.FaqService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cs")
public class CSController {
	
//	@Value("${pageSize}")
//	private long pageSize;
//	
//	@Value("${blockSize}")
//	private long blockSize;
	
	private NoticeService noticeService;
	private FaqService faqService;

	public CSController(FaqService faqService, NoticeService noticeService) {
		this.faqService = faqService;
		this.noticeService = noticeService;
	}
	
	@GetMapping("/main.do")
	public String main(Model model) throws Exception {
		try {
			List<FaqDTO> list = faqService.getfaqList(); 
			List<NoticeDTO> Nlist = noticeService.getNoticeListFive();
			model.addAttribute("list", list);
			model.addAttribute("Nlist",Nlist);
			return "cs.faq.faqMainList";
		}
		catch(Exception e ) {
			model.addAttribute("msg","list 출력 에러");
			model.addAttribute("url","index"); 
			return "result";
		}
		
	}
	
	@GetMapping("/noticeList.do")
	public String noticeList(Model model) {
			try {
//				long recordCount = boardService.getBoardCount();
//				long pageCount = recordCount / pageSize;
//				if (recordCount % pageSize != 0) pageCount++;
//				
//				long startPage = (pg -1) / blockSize * blockSize + 1;
//				long endPage = startPage + blockSize - 1;
//				if(endPage > pageCount) endPage = pageCount;
//				
				
				List<NoticeDTO> list = noticeService.getNoticeList();
				
				model.addAttribute("list", list);
				log.info(list);
//				model.addAttribute("pageCount", pageCount);
//				
//				model.addAttribute("pg", pg);
//				model.addAttribute("startPage",startPage);
//				model.addAttribute("endPage", endPage);
//				model.addAttribute("recordCount", recordCount);
//				model.addAttribute("pageSize",pageSize);
				return "cs.notice.noticeList";
			} catch (Exception e) {
				model.addAttribute("msg", "list 출력 에러");
				model.addAttribute("url", "index");
				return "cs.index";
			}
		}
	
	@GetMapping("/noticeView.do")
	public String noticeView(@RequestParam String articleid, Model model) {
		
		NoticeDTO article;
		
		try {
			article = noticeService.getNoticeArticle(articleid);
			model.addAttribute("article", article);
			return "cs.notice.noticeDetail";

		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "index");
			return "cs.index";
		}
		
	}
	
	@GetMapping("/qnaInsPopUp")
	public String qnaInsert() {
		return "cs/qna/qnaInsertPopup";
	}
	
	
	@GetMapping("/findInOrder")
	public String findInOrder() {
		return "cs/qna/orderListPopup";
	}
	
	@GetMapping("/findInCart")
	public String findInCart() {
		return "cs/qna/cartListPopup";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/qna.do")
	public String qnaList() {
		return "cs.qna.qnaList";
	}
	
	@GetMapping("/faq.do")
	public String faqList(Model model) {
		try {
			List<FaqDTO> list = faqService.getfaqListAll(); 
			model.addAttribute("list", list);
			return "cs.faq.faqList";
		}
		catch(Exception e ) {
			model.addAttribute("msg","list 출력 에러");
			model.addAttribute("url","index"); 
			return "result";
		}
		
	}
	
	
}
