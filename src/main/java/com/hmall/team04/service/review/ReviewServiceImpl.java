package com.hmall.team04.service.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dao.file.FileDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.PageDTO;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ProductBoardDAO productboardDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private ReviewDAO reviewDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private FileDAO fileDAO;
	
	private int pageSize=10;

	
	@Override
	public ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws Exception {
		// 읽어들인 Review의 file_yn이 1이면 추가로 사진 정보를 읽어온다.
		ArrayList<ReviewDTO> reviewDTO = reviewDAO.getReviewListByInsdtCore(reviewcri);
		
		for(int i=0;i<reviewDTO.size();i++) {
			
			if(reviewDTO.get(i).getFile_yn()==1) {
				FileDTO file = new FileDTO();
				file.setArticle_id(reviewDTO.get(i).getReview_id());
				file.setBoard_flag("review");
				reviewDTO.get(i).setFileList(fileDAO.getReviewFileList(file));
			}
		}
		
		return reviewDTO;
	}
	
	@Override
	public int getReviewListCountCore(String prd_board_id) throws Exception{
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListCountCore(prd_board_id);
	}


	@Override
	public void enrollReview(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int ReviewIsExist(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.ReviewIsExist(reviewDTO);
	}

	@Override
	public int ReviewIsPossible(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.ReviewIsPossible(reviewDTO);
	}

	@Override
	public void insertReview(ReviewDTO reivewDTO) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.insertReview(reivewDTO);
	}

	@Override
	public void s3FileUpload(MultipartFile file) {
		// TODO Auto-generated method stub
		if(file != null && !file.getOriginalFilename().equals("")) {
			System.out.println(file.getOriginalFilename());
			
//			File localFile = new File("/Users/jinhobae/Downloads/" + file.getOriginalFilename());
//			file.transferTo(localFile);
//			
//			System.out.println(localFile.getName());
//			PutObjectRequest obj = new PutObjectRequest(BUCKET_NAME, localFile.getName(), localFile);
//			obj.setCannedAcl(CannedAccessControlList.PublicRead);
//			String imageUrl = "https://reviewaws.s3.ap-northeast-2.amazonaws.com/"+localFile.getName();
//			s3.putObject(obj);
			//System.out.println(imageUrl);
			//reviewVO.setS3ImageUrl(imageUrl);
			
			//reviewMapper.insertReview(reviewVO);
		}else {
			//reviewMapper.insertReview(reviewVO);
		}
	}
	
}
