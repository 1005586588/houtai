package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import entity.Operator;
import service.Operator_service;

@Controller

public class login_Controller {

	@Autowired
	Operator_service oservice;
	
	@RequestMapping("login")
    public @ResponseBody int login(Operator o,String code,HttpSession session,HttpServletRequest req){
		if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
			if(o.getNike()=="") {
				return -1;
			}else if(o.getPassword()=="") {
				return -2;
			}else if (oservice.login(o)==null) {
				return 1;
			}else {
			Operator sqlOperator= oservice.login(o);
			 if(o.getPassword().equals(sqlOperator.getPassword())) {
				req.getSession().setAttribute("operator", sqlOperator);
				req.getSession().setMaxInactiveInterval(5000000);
				
				return 0;
			}else {
				return 2;
			}
			}
		}else {
			return -3;
		}
		
	}
	
//	@RequestMapping("index")
//	 public String index(){
//		return "index";
//	}
//	
//	@RequestMapping("a")
//	 public String a(){
//		return "login";
//	}
	
	
        
}
