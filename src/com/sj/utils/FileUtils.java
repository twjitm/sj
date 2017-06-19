package com.sj.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sj.entity.User;


public class FileUtils {
	/**
	 * 保存文件并返回保存地组织
	 * @param request
	 * @param file
	 * @return
	 */
	public static String saveFile(User user, HttpServletRequest request,MultipartFile file,String modeName ){
		//try {
		if(file!=null){
			String dburl="";//存入数据库中的路径
			String real= request.getServletContext().getRealPath("/")+"\\file"+"\\"+modeName+"\\";
			dburl="\\file"+"\\"+modeName+"\\";
			real=real+user.getUrAccess()+"\\";
			dburl=dburl+user.getUrAccess()+"\\";
			Date date=new Date();
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			real=real+format.format(date)+"\\";
			dburl=dburl+format.format(date)+"\\";
			String fileName = file.getOriginalFilename();//获取文件的真实姓名
			File tempFile=new File(real,fileName);
			//文件夹不存在
			if(!tempFile.getParentFile().exists()){
				tempFile.getParentFile().mkdirs();//创建 
			}
			if (!tempFile.exists()) {  
				try {
					tempFile.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
			}  
			try {
				file.transferTo(tempFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			dburl=dburl.replace("\\","\\\\");

			return dburl+fileName;
		}
		System.out.println("file is null ");
		return "error";
	}

}
