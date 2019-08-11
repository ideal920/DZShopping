package com.web.util;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

public class AdminInterceptor  extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception{
        Map<String,Object> session=actionInvocation.getInvocationContext().getSession();
        String storeName=session.get("storeName").toString();
        if (storeName.equals("admin")){
            //如果是管理员则执行action
            return actionInvocation.invoke();
        }
        else{
            return "notAdmin";
        }
    }
}
