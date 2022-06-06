package com.hmall.team04.service.file;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
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

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FileServiceImpl implements FileService {

	private static String BUCKET_NAME = "eveadam";
    private static String ACCESS_KEY="AKIA6EN3BZ4CYVUA7X5L";
    private static String SECRET_KEY="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";
    
    AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

    private AmazonS3 s3= AmazonS3Client.builder()
			.withRegion(Regions.AP_NORTHEAST_2)
			.withCredentials(new AWSStaticCredentialsProvider(credentials)).build();
    
    public void s3FileUpload(MultipartFile file) throws Exception {
    	String uploadFolderPath = "upload";
    	String filename = file.getOriginalFilename();
    	log.info(filename);
    	
    	UUID uuid = UUID.randomUUID();
    	String uploadImageName = uuid.toString()+"_"+filename;
    	
    	String s3Path = uploadFolderPath+"/"+uploadImageName;
    	
        try {
            // set ObjectMatadata
            byte[] bytes = IOUtils.toByteArray(file.getInputStream());

            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(bytes.length);
            objectMetadata.setContentType(file.getContentType());

            // save in S3
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
            this.s3.putObject(BUCKET_NAME, s3Path.replace(File.separatorChar, '/'), byteArrayInputStream, objectMetadata);
      	  
            byteArrayInputStream.close();
            
            }catch(Exception e){
            	log.error(e.getMessage());
            }
    	
	}

	
}
