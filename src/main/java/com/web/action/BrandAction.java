package com.web.action;

import java.io.File;
import java.util.List;

import com.web.domain.Brand;
import com.web.service.BrandService;
import com.web.util.FileUploadInter;

public class BrandAction {
	private BrandService brandServiceInter;
	private List<Brand> list;
	private Brand brand;
	private FileUploadInter fileUploadInter;//文件上传接口
	private File upload;
	private String uploadContentType;//上传的文件类型
	private String uploadFileName;//上传的文件全名

	public BrandService getBrandServiceInter() {
		return brandServiceInter;
	}
	public void setBrandServiceInter(BrandService brandServiceInter) {
		this.brandServiceInter = brandServiceInter;
	}
	public List<Brand> getList() {
		return list;
	}
	public void setList(List<Brand> list) {
		this.list = list;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public FileUploadInter getFileUploadInter() {
		return fileUploadInter;
	}
	public void setFileUploadInter(FileUploadInter fileUploadInter) {
		this.fileUploadInter = fileUploadInter;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	public String findAll(){
		list= brandServiceInter.findAllBrand();
		return "findAllSuccess"; 
	}
	public String add() {
		String fileName=fileUploadInter.uploadFile(upload, uploadContentType, uploadFileName);
		brand.setBrandImg("brandImg/"+fileName);
		list= brandServiceInter.addBrand(brand);
		return "addSuccess";
	}
	public String update() {
		String fileName=fileUploadInter.uploadFile(upload, uploadContentType, uploadFileName);
		brand.setBrandImg("brandImg/"+fileName);
		list= brandServiceInter.updateBrand(brand);
		return "updateSuccess";
	}
	
	
}
