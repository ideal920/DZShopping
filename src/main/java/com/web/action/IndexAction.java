package com.web.action;

import com.web.domain.Brand;
import com.web.domain.Category;
import com.web.domain.Product;
import com.web.service.BrandService;
import com.web.service.CategoryService;
import com.web.service.ProductService;

import java.util.List;

public class IndexAction {
    private CategoryService categoryServiceInter;
    private BrandService brandServiceInter;
    private ProductService productService;

    private List<Category> listCategory;
    private List<Brand> listBrand;
    private List<Product> listNewProduct;
    private List<Product> listLowPrice;
    private List<Product> listHot;

    public CategoryService getCategoryServiceInter() {
        return categoryServiceInter;
    }
    public void setCategoryServiceInter(CategoryService categoryServiceInter) {
        this.categoryServiceInter = categoryServiceInter;
    }
    public BrandService getBrandServiceInter() {
        return brandServiceInter;
    }
    public void setBrandServiceInter(BrandService brandServiceInter) {
        this.brandServiceInter = brandServiceInter;
    }
    public ProductService getProductService() { return productService; }
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

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

    public List<Product> getListNewProduct() {
        return listNewProduct;
    }
    public void setListNewProduct(List<Product> listNewProduct) {
        this.listNewProduct = listNewProduct;
    }
    public List<Product> getListLowPrice() {
        return listLowPrice;
    }
    public void setListLowPrice(List<Product> listLowPrice) {
        this.listLowPrice = listLowPrice;
    }
    public List<Product> getListHot() {
        return listHot;
    }
    public void setListHot(List<Product> listHot) {
        this.listHot = listHot;
    }

    public String show(){
        listCategory= categoryServiceInter.findAllCategory();
        listBrand= brandServiceInter.findAllBrand();
        listNewProduct= productService.findProductByDate(4, 1).getProductList();
        listLowPrice= productService.findProductByPrice(4, 1).getProductList();
        listHot= productService.findProductByHot(4, 1).getProductList();
        return "showSuccess";
    }
}
