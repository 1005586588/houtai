package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import entity.Orders;
import entity.Orders_status;
import service.Address_service;
import service.Orders_service;
import service.Orders_status_service;
import service.User_service;
import util.SearchInfo;
import util.JsonUtil.jsonInfo;

@Controller
@RequestMapping("orders")
public class Orders_Controller {

	@Autowired
	Orders_service service;
	@Autowired
	Address_service aservice;
	@Autowired
	User_service sservice;
	@Autowired
	Orders_status_service oservice;
	
	@RequestMapping("index")
	public void index(Integer select, String txt, SearchInfo info, ModelMap m) {

		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar = new GregorianCalendar(); 
		 calendar.setTime(new Date());
		 calendar.add(calendar.DATE,1);
		 String date2 = sdf.format(calendar.getTime());
		 
		
		if (select == null) select = 0;
		String where = "";
		
		if (txt != null && txt.length() > 0) {
			switch (Integer.valueOf(txt)) {
			case 1:
				calendar.add(calendar.DATE, -30);
				Date date=calendar.getTime();
				String date1=sdf.format(date);
				where = " where  Orders.date < '"+date2+"'  and Orders.date > '"+date1+"' ";
				break;
			case 2:
				calendar.add(calendar.DATE, -7);
				Date date3=calendar.getTime();
				String date4=sdf.format(date3);
				where = " where  Orders.date < '"+date2+"'  and Orders.date > '"+date4+"' ";
				break;
			case 3:
				calendar.add(calendar.DATE, -1);
				Date date5=calendar.getTime();
				String date6=sdf.format(date5);	
				where = " where  Orders.date < '"+date2+"'  and Orders.date > '"+date6+"' ";
				break;
			default :
			}
			m.put("txt",txt);
		}
		m.put("select", select);
	
		m.put("typerow1", aservice.select());
		m.put("typerow2", sservice.select());
		info.setWhere(where);
		m.put("search", info);
//		info.setCanPage(false);
		m.put("list", service.select(info));
	}


	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
		return "redirect:index";
	}

	@RequestMapping("deleteall")
	public String deleteall(String ids) {
		// SqlHelper.executeUpdate("delete from quesbal where id in ("+ids+") ");
		return "redirect:index";
	}

	@RequestMapping("updatestatus")
	public String updatestatus(int id, ModelMap m) {
		
		m.put("info", service.getById(id));
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 String date = sdf.format(new Date());
		 m.put("date", date);
		return "orders/edit";
	}
	
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(Orders o,Orders_status a) {
//		o.setId(a.getOrders_id());
		service.updatestatus(o);
		oservice.insert(a);
		return new jsonInfo(1, "");
	}
}
