package com.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.web.domain.User;
import com.web.service.UserService;

import java.util.Map;

public class UserAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private User user;
	private UserService userService;
	private Boolean result;

	private String oldPassword;
	private String newPassword;
	private String confirmPassword;
	private String resultPassword;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Boolean getResult() {
		return result;
	}
	public void setResult(Boolean result) {
		this.result = result;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getResultPassword() {
		return resultPassword;
	}
	public void setResultPassword(String resultPassword) {
		this.resultPassword = resultPassword;
	}

	public String isExists() {
		result= userService.userNameIsExists(user.getUserName());
		return "isExistsSuccess";
	}
	
	public String add(){
		user.setUserMoney(1000000.0000);
		userService.addUser(user);
		return "addSuccess";
	}
	
	public String login(){
		String result= userService.isLogin(user.getUserName(), user.getUserPassword());
		if (result.equals("success")) {
			Map<String, Object> map=ActionContext.getContext().getSession();
			map.put("userName", user.getUserName());
			return "loginSuccess";
		} else {
			addFieldError("error",result);
			return "loginError";
		}
	}

	public String updatePassword(){
		Map<String,Object> session=ActionContext.getContext().getSession();
		String userName=(String)session.get("userName");
		resultPassword= userService.updatePassword(userName,oldPassword,newPassword,confirmPassword);
		return "updatePasswordSuccess";
	}
	
	public String logout() {
		Map<String, Object> map=ActionContext.getContext().getSession();
		map.remove("userName");
		return "logoutSuccess";
	}
}
