package com.fred.proj.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fred.proj.vo.FileVO;


@Component
public class FileUtil {
	String sPath;
	
	public FileVO parseFileInfo(MultipartFile file, HttpServletRequest req, FileVO vo) throws Exception {
		
		HttpSession session = req.getSession();
		
		sPath = session.getServletContext().getRealPath("/");
		System.out.println("rpath : " + sPath);
		sPath = sPath + "resources/upload/";
		
		
		File target = new File(sPath);
		
		if(!target.exists()) target.mkdirs();
	
		String orgFileName = file.getOriginalFilename();
		String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
		String saveFileNmae = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
		Long saveFileSize = file.getSize();
		
		System.out.println("================== file start ==================");
        System.out.println("파일 이름: "+saveFileNmae);
        System.out.println("파일 실제 이름: "+file.getOriginalFilename());
        System.out.println("파일 크기: "+file.getSize());
        System.out.println("content type: "+file.getContentType());
        System.out.println("================== file   END ==================");
        
        target = new File(sPath, saveFileNmae);
        file.transferTo(target);
        
        
        
        vo.setF_directory(sPath);
        vo.setF_oriname(orgFileName);;
        vo.setF_savename(saveFileNmae);
        vo.setF_length(saveFileSize);

        
        System.out.println(vo.getF_directory()+vo.getF_savename());
        
		return vo;
		
	}
	
	public void deleteFile(FileVO vo) {
		File target = new File(vo.getF_directory()+vo.getF_savename());
		if(target.exists()) {
			if(target.delete()) {
				System.out.println("파일삭제 성공");
			}else {
				System.out.println("파일삭제 실패");
				
			}
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
	}
}	

