package com.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.web.domain.Brand;
import com.web.domain.Category;
import com.web.domain.Product;
import com.web.domain.Store;
import com.web.service.BrandService;
import com.web.service.CategoryService;
import com.web.service.ProductService;
import com.web.service.StoreService;
import com.web.util.FileUploadInter;
import com.web.util.PageBean;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ProductAction {
	
	/*依赖式注入，体现在applicationContext.xml中*/
	
	private BrandService brandServiceInter;
	private CategoryService categoryServiceInter;
	private ProductService productService;
	private StoreService storeService;
	private FileUploadInter fileUploadInter;   
	public BrandService getBrandServiceInter() {
		return brandServiceInter;
	}
	public void setBrandServiceInter(BrandService brandServiceInter) {
		this.brandServiceInter = brandServiceInter;
	}
	public CategoryService getCategoryServiceInter() {
		return categoryServiceInter;
	}
	public void setCategoryServiceInter(CategoryService categoryServiceInter) {
		this.categoryServiceInter = categoryServiceInter;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public StoreService getStoreService() {
		return storeService;
	}
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	public FileUploadInter getFileUploadInter() {
		return fileUploadInter;
	}
	public void setFileUploadInter(FileUploadInter fileUploadInter) {
		this.fileUploadInter = fileUploadInter;
	}

    /*接收页面传出的值*/
    private Product product;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
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
	
	/*向页面传值*/
    private List<Category> listCategory;
    private List<Brand> listBrand;
    private List<Product> listCategoryProduct;
	public List<Category> getListCategory() {
		return listCategory;
	}
	public void setListCategory(List<Category> listCategory) {
		this.listCategory = listCategory;
	}
	public List<Brand> getListBrand() {
		return listBrand;
	}
	public void setListBrand(List<Brand> listBrand) {
		this.listBrand = listBrand;
	}
	public List<Product> getListCategoryProduct() {
		return listCategoryProduct;
	}
	public void setListCategoryProduct(List<Product> listCategoryProduct) {
		this.listCategoryProduct = listCategoryProduct;
	}

	/*分页操作*/
    private int currentCount;
    private int currentPage;
    private PageBean<Product> pageBean; 
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public PageBean<Product> getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean<Product> pageBean) {
		this.pageBean = pageBean;
	}
	

	private String resultBuy;
	public String getResultBuy() {
		return resultBuy;
	}
	public void setResultBuy(String resultBuy) {
		this.resultBuy = resultBuy;
	}
	
	
	public String findCategoryBrand() {
		//查询所有类别和品牌
		listCategory= categoryServiceInter.findAllCategory();
		listBrand= brandServiceInter.findAllBrand();
		return "findCategoryBrandSuccess";
	}
	public String add() {
		//商品图片上传
		String fileName=fileUploadInter.uploadFile(upload, uploadContentType, uploadFileName);
		product.setProductImg("brandImg/"+fileName);
		
		product.setProductStatus(1);
		//获取登陆的网店名
		Map<String, Object> session= ActionContext.getContext().getSession();
		String storeName=(String) session.get("storeName");
		Store store= storeService.findStoreByName(storeName).get(0);
		product.setStore(store);
		product.setCreateDate(new Date());
		
		productService.addProduct(product);
		return "addSuccess";
	}
	
	public String findPage(){
     //查询商品并进行分条、分页
   	 pageBean= productService.findProductByPage(product.getProductName(), currentCount, currentPage);
   	 return "findPageSuccess";
    }
	
	public String findId(){
		//查询所有类别和品牌
	    listCategory= categoryServiceInter.findAllCategory();
	   	listBrand= brandServiceInter.findAllBrand();
	   	//查询商品id
	    product= productService.findProductById(product.getProductId());
	    return "findIdSuccess";
	 }
	
	public String update() {
		//根据id查询原来数据
		Product newProduct= productService.findProductById(product.getProductId());
		
		//让修改的值设置在此对象上
		newProduct.setProductName(product.getProductName());
		newProduct.setProductNewPrice(product.getProductNewPrice());
		
		if(upload!=null) {
			String fileName=fileUploadInter.uploadFile(upload, uploadContentType, uploadFileName);
			newProduct.setProductImg("brandImg/"+fileName);
		}
		
		newProduct.setProductStatus(product.getProductStatus());
		newProduct.setProductRemark(product.getProductRemark());
		newProduct.setCategory(product.getCategory());
		newProduct.setBrand(product.getBrand());
		
		//执行修改
		productService.updateProduct(newProduct);
		return "updateSuccess";
	}
	
	//商品详细信息
	public String findDetail(){
		product= productService.findProductById(product.getProductId());
		listCategoryProduct= productService.findProductByXG(product.getProductId(),product.getCategory().getCategoryId(),4,1).getProductList();
		return "findDetailSuccess";
	}

	//类别商品
	public String findCategory(){
		pageBean= productService.findProductByCategory(product.getCategory().getCategoryId(),currentCount,currentPage);
		return "findCategorySuccess";
	}

	//品牌商品
	public String findBrand(){
		pageBean= productService.findProductByBrand(product.getBrand().getBrandId(),currentCount,currentPage);
		return "findBrandSuccess";
	}

	//新到商品
	public String findNew(){
		pageBean= productService.findProductByDate(currentCount,currentPage);
		return "findNewSuccess";
	}

	//差价大商品
	public String findLowPrice(){
		pageBean= productService.findProductByPrice(currentCount,currentPage);
		return "findLowPriceSuccess";
	}

	//商品类别火爆商品
	public String findHot(){
		pageBean= productService.findProductByHot(currentCount,currentPage);
		return "findHotSuccess";
	}

	//搜索商品
	public String findLikeName(){
		pageBean= productService.findProductByLikeName(product.getProductName(),currentCount,currentPage);
		return "findLikeNameSuccess";
	}
	
	//购买商品
	public String buy() {
		resultBuy= productService.buyProduct(product);
		return "buySuccess";
	}
	
}
