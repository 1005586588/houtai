package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Orders_status;
import service.Orders_service;
import service.Orders_status_service;

@Controller
@RequestMapping("orders_status")
public class Orders_status_Controller {

	@Autowired
	Orders_status_service service;
	@Autowired
	Orders_service sservice;
	
	@RequestMapping("insert")
	public void updatestatus(Orders_status o) {
		service.insert(o);
	}
	

}
