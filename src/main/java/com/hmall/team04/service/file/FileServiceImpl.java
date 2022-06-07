package com.hmall.team04.service.file;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.util.IOUtils;
import com.hmall.team04.controller.review.ReviewListController;
import com.hmall.team04.dao.file.FileDAO;
import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FileServiceImpl implements FileService {

	@Setter(onMethod_ = { @Autowired })
	private FileDAO fileDAO;
	
	
//	@Value("${s3.bucketname}")
	private String BUCKET_NAME="eveadam";
//
//	@Value("${s3.accesskey}")
	private String ACCESS_KEY="AKIA6EN3BZ4CYVUA7X5L";
//	
//	@Value("${s3.secretkey}")
	private String SECRET_KEY="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";
    
    AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

    private AmazonS3 s3= AmazonS3Client.builder()
			.withRegion(Regions.AP_NORTHEAST_2)
			.withCredentials(new AWSStaticCredentialsProvider(credentials)).build();
    
    public void s3FileUpload(ReviewDTO reviewDTO) throws Exception {
		log.info(reviewDTO.toString());
		MultipartFile[] files = reviewDTO.getUploadfiles();
		log.info(files);
    	
    	String imageURL = "";
    	String uploadFolderPath = "upload";
    	
    	// save image at s3 and save imageURL at db
		try {
			for (MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				log.info(filename);

				UUID uuid = UUID.randomUUID();
				String uploadImageName = uuid.toString() + "_" + filename;
				String s3Path = uploadFolderPath + "/" + uploadImageName;

				// set ObjectMatadata
				byte[] bytes = IOUtils.toByteArray(file.getInputStream());

				ObjectMetadata objectMetadata = new ObjectMetadata();
				objectMetadata.setContentLength(bytes.length);
				objectMetadata.setContentType(file.getContentType());

				// save in S3
				ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
				this.s3.putObject(BUCKET_NAME, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream,
						objectMetadata);

				byteArrayInputStream.close();

				// save imageURL at db via fileDTO
				FileDTO fileDTO = new FileDTO();
				fileDTO.setArticle_id(reviewDTO.getReview_id());
				imageURL = "https://hd-team04.s3.ap-northeast-2.amazonaws.com/" + s3Path;
				fileDTO.setUpload_path(imageURL);
				
				// fixed val, at now
				fileDTO.setFile_nm("image");
				fileDTO.setFile_type("i");
				fileDTO.setBoard_flag("review");
				
				log.info(fileDTO);
				fileDAO.insertReviewFile(fileDTO);
			}

		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
}
