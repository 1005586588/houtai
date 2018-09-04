package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.User;
import service.Product_service;
import service.Shopcar_service;
import service.User_service;
import util.SearchInfo;

@Controller
@RequestMapping("shopcar")
public class Shopcar_Controller {

	@Autowired
	Shopcar_service service;
	@Autowired
	Product_service pservice;
	@Autowired
	User_service sservice;
	
	@RequestMapping("index")
	public void index(Integer select, String txt, SearchInfo info, ModelMap m) {

		if (select == null) select = 0;
		String where = "";
		if (txt != null && txt.length() > 0) {
			switch (select) {
			case 1:
				where = " where  shopcar.user_id =  " + txt + " ";
				break;
			default:
				where = " where product.fullname like  '%" + txt + "%' ";
			}
			m.put("txt",txt);
		}
		m.put("select", select);
	
		m.put("typerow1", pservice.select(info));
		m.put("typerow2", sservice.select());
		info.setWhere(where);
		m.put("search", info);
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
	
	@RequestMapping("show")
	public String show(int id,ModelMap m) {
		m.put("productlist", pservice.getById(id));
		return "shopcar/edit";
	}

}
