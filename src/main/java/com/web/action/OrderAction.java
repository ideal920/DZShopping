package com.web.action;

import com.web.domain.Order;
import com.web.service.OrderService;
import com.web.util.PageBean;

import java.util.List;

public class OrderAction {

    private OrderService orderService;
    private PageBean<Order> pageBean;
    private String orderDate;
    private int currentCount;
    private int currentPage;
    private int orderId;
    private String resultStatus;
    private String beginDate;
    private String endDate;
    private List listSale;

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public PageBean<Order> getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean<Order> pageBean) {
        this.pageBean = pageBean;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getResultStatus() {
        return resultStatus;
    }

    public void setResultStatus(String resultStatus) {
        this.resultStatus = resultStatus;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public List getListSale() {
        return listSale;
    }

    public void setListSale(List listSale) {
        this.listSale = listSale;
    }

    /*查询网店，并分页*/
    public String findStore(){
        pageBean= orderService.findStoreOrderByPage(orderDate,currentCount,currentPage);
        return "findStoreSuccess";
    }

    /*修改订单状态*/
    public String updateStoreStatus(){
        orderService.updateStatus(orderId,2);
        resultStatus="发货成功!";
        return "updateStoreStatusSuccess";
    }

    /*查询会员，并分页*/
    public String findUser(){
        pageBean= orderService.findUserOrderByPage(orderDate,currentCount,currentPage);
        return "findUserSuccess";
    }

    /*修改订单状态*/
    public String updateUserStatus(){
        orderService.updateStatus(orderId,3);
        resultStatus="收货成功!";
        return "updateUserStatusSuccess";
    }

    /*查询商品订单*/
    public String findProductSale(){
        pageBean= orderService.findProductSaleByPage(beginDate,endDate,currentCount,currentPage);
        return "findProductSaleSuccess";
    }

    /*查询网店订单*/
    public String findStoreSale(){
        listSale= orderService.findStoreSale(beginDate,endDate);
        return "findStoreSaleSuccess";
    }
}
