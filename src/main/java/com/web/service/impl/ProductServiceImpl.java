package com.web.service.impl;

import com.opensymphony.xwork2.ActionContext;
import com.web.dao.ProductDao;
import com.web.domain.Order;
import com.web.domain.Product;
import com.web.domain.Store;
import com.web.domain.User;
import com.web.service.OrderService;
import com.web.service.ProductService;
import com.web.service.StoreService;
import com.web.service.UserService;
import com.web.util.PageBean;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;
	private StoreService storeService;
	private UserService userService;
	private OrderService orderService;

	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	public StoreService getStoreService() {
		return storeService;
	}
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}


	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
	}

	@Override
	//分页商品
	public PageBean<Product> findProductByPage(String productName, int currentCount, int currentPage) {

		String hqlCount="";
		String hqlList="";
		
		//获取登陆的网店名
		Map<String, Object> map= ActionContext.getContext().getSession();
		String storeName=(String) map.get("storeName");
		Store store= storeService.findStoreByName(storeName).get(0);
		
		//假如商品名称为空，就查询该网店的商品数量和商品信息
		if (productName.equals("")) {
			hqlCount="select count(p) from Product as p where p.store.storeId="+store.getStoreId();
			hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,p.productStatus,"
					+ "p.category.categoryName,"
					+ "p.brand.brandName from Product as p where p.store.storeId=" +
					store.getStoreId()+"  order by p.productId";
		
		//否则,当输入查询的东西时,就查询该商品的数量和商品信息
		}else{
			hqlCount="select count(p) from Product as p where p.productName like '%"+
					productName+"%' and p.store.storeId="+store.getStoreId();
			hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,p.productStatus,"
					+ "p.category.categoryName,"
					+ "p.brand.brandName from Product as p where p.productName like '%"+
					productName+"%' and p.store.storeId=" +
					store.getStoreId()+"  order by p.productId";
		}
		
		PageBean<Product> pageBean=new PageBean<Product>();
		
		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);
		
		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);
		
		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		
		return pageBean;
	}

	@Override
	public Product findProductById(int productId) {
		return productDao.findProductById(productId);
	}
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

	@Override
	//新加商品
	public PageBean<Product> findProductByDate(int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1";
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,"
				+ "p.productImg from Product as p where p.productStatus=1 " +
				"order by p.createDate desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	//差价大的商品
	public PageBean<Product> findProductByPrice(int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1";
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,"
				+ "p.productImg from Product as p where p.productStatus=1 " +
				"order by p.productOldPrice-p.productNewPrice desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	//类别热度火爆的商品
	public PageBean<Product> findProductByHot(int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1 and p.category.categoryHot=3";
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,"
				+ "p.productImg from Product as p where p.productStatus=1 and p.category.categoryHot=3 "
				+ "order by p.productOldPrice-p.productNewPrice desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	//类别商品
	public PageBean<Product> findProductByCategory(int categoryId, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1 and p.category.categoryId="+categoryId;
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice, "
				+ "p.productImg from Product as p where p.productStatus=1 and p.category.categoryId="+categoryId
				+ " order by p.productOldPrice-p.productNewPrice desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	//品牌商品
	public PageBean<Product> findProductByBrand(int brandId, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1 and p.brand.brandId="+brandId;
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice, "
				+ "p.productImg from Product as p where p.productStatus=1 and p.brand.brandId="+brandId
				+ " order by p.productOldPrice-p.productNewPrice desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	//去重
	public PageBean<Product> findProductByXG(int productId, int categoryId, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		hqlCount="select count(p) from Product as p where p.productStatus=1 and p.category.categoryId="+categoryId
				+" and p.productId<>"+productId;
		hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice, "
				+ "p.productImg from Product as p where p.productStatus=1 and p.category.categoryId="+categoryId
				+" and p.productId<>"+productId
				+ " order by p.productOldPrice-p.productNewPrice desc,p.productId desc";

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	@Override
	public PageBean<Product> findProductByLikeName(String productName, int currentCount, int currentPage) {
		String hqlCount="";
		String hqlList="";

		if (productName.equals("")){
			hqlCount="select count(p) from Product as p where p.productStatus=1";
			hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,"
					+ "p.productImg from Product as p where p.productStatus=1 "
					+ "order by p.productId";
		}else{
			hqlCount="select count(p) from Product as p where p.productStatus=1 and p.productName like '%"
					+productName+"%'";
			hqlList="select p.productId,p.productName,p.productOldPrice,p.productNewPrice,"
					+ "p.productImg from Product as p where p.productStatus=1 and p.productName like '%"
					+productName+"%' order by p.productId";
		}

		PageBean<Product> pageBean=new PageBean<Product>();

		int totalCount= productDao.findProductCount(hqlCount);
		pageBean.setTotalCount(totalCount);

		List<Product> list= productDao.findProductByPage(hqlList, currentCount, currentPage);
		pageBean.setProductList(list);

		int totalPage=(int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	/*购买商品*/
	public String buyProduct(Product product) {
		String resultBuy="";
		Order order=new Order();
		//设置购买商品
		order.setProduct(product);
		//获取用户名
		Map<String, Object> session= ActionContext.getContext().getSession();
		String userName=(String) session.get("userName");
		//根据用户获取User对象
		User user= userService.findUserByName(userName).get(0);
		//设置购买用户
		order.setUser(user);
		//设置下单日期
		order.setOrderDate(new Date());
		//设置订单状态
		order.setOrderStatus(1);
		//获取商品id
		Product myProduct=this.findProductById(product.getProductId());
		//设置订单网店
		order.setStoreId(myProduct.getStore().getStoreId());
		//假如该商品没有现价
		if(myProduct.getProductNewPrice()==null){
			//就按照原价价格购买
			order.setOrderMoney(myProduct.getProductOldPrice());
			if(user.getUserMoney()>=myProduct.getProductOldPrice()){
				userService.updateMoney(user.getUserId(),myProduct.getProductOldPrice());
				storeService.updateMoney(myProduct.getStore().getStoreId(),myProduct.getProductOldPrice());
				//调用业务逻辑，生成订单
				orderService.addOrder(order);
				resultBuy="购买成功";
			}else{
				resultBuy="您的账户余额不足,无法完成购买!";
			}
		}else{
			//按照现价购买
			order.setOrderMoney(myProduct.getProductNewPrice());
			if(user.getUserMoney()>=myProduct.getProductNewPrice()){
				userService.updateMoney(user.getUserId(),myProduct.getProductNewPrice());
				storeService.updateMoney(myProduct.getStore().getStoreId(),myProduct.getProductNewPrice());
				//调用业务逻辑，生成订单
				orderService.addOrder(order);
				resultBuy="购买成功";
			}else{
				resultBuy="您的账户余额不足,无法完成购买!";
			}
		}
		return resultBuy;
	}
}
