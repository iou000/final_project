package com.hmall.team04.service.file;


import org.springframework.web.multipart.MultipartFile;


public interface FileService {

	public void s3FileUpload(MultipartFile file) throws Exception;

}
