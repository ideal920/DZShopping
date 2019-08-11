package com.web.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

public class FileUpload implements FileUploadInter {

	//上传的文件路径
	private String filePath="/brandImg";
	
	//实现文件上传的功能，返回上传后新的文件名称
	public String uploadFile(File file, String contentType, String fileName) {
		try {
			//根据文件创建输入流
			FileInputStream fileInputStream=new FileInputStream(file);
			
			//通过getRealPath() 将相对路径转换为物理路径
			String physicalPath=ServletActionContext.getServletContext().getRealPath(filePath);
			
			//重新生成新的文件名,newFileName()方法在下方定义
			String newFileName=newFileName(fileName);
			
			//创建输出流对象
			FileOutputStream fileOutputStream=new FileOutputStream(physicalPath+"\\"+newFileName);
			
			//创建一个临时数组
			byte[] buffer=new byte[1024];
			
			//将输入流中的数据读取到byte数组中，read()方法读取输入流中的数据，返回的值大于0，说明没有读取完
			while(fileInputStream.read(buffer)>0){
				//使用输出流将数组中的数据，写入硬盘
				fileOutputStream.write(buffer);
			}
			//关闭输入流对象
			fileInputStream.close();
			//强制将缓冲区的数据写入硬盘
			fileOutputStream.flush();
			//关闭输出流对象
			fileOutputStream.close();
			
			return newFileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
	}

	//通过文件名获取拓展名
	private String getFileExt(String fileName){
		//getExtension()获取文件拓展名
		return FilenameUtils.getExtension(fileName);
	}
	//生成UUID随机数，作为新的文件名，保证上传后的文件是唯一的，不会被覆盖
	private String newFileName(String fileName) {
		String ext=getFileExt(fileName);
		//UUID通过唯一识别码，randomUUID();随机生成唯一识别码
		return UUID.randomUUID().toString()+"."+ext;
	}

}
