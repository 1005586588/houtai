package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import service.Operator_service;
import util.Ids;
import util.JsonUtil.jsonInfo;
import util.SearchInfo;

@Controller
@RequestMapping("operator")
public class Operator_Controller {

	@Autowired
	Operator_service service;
	
	@RequestMapping("index")
	public void index(Integer select, String txt, SearchInfo info, ModelMap m) {

		if (select == null) select = 0;
		String where = "";
		if (txt != null && txt.length() > 0) {
			switch (select) {
			case 1:
				where = "where operator.power = " + txt + " ";
				break;
			default:
				where = "where operator.nike like  '%" + txt + "%' ";
			}
		}
		m.put("select", select);
		m.put("txt", select == 0 ? "'" + txt + "'" : txt);
	
		m.put("powerstatus", Operator.powerstatus);
		 
		info.setWhere(where);
		m.put("search", info);
//		info.setCanPage(false);
		m.put("list", service.select(info));
	}

	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(Operator o) {
		service.insert(o);
		return new jsonInfo(1, "");
	}

	@RequestMapping("update")
	public @ResponseBody jsonInfo update(Operator o) {
		service.update(o);
		return new jsonInfo(1, "");
	}
	@RequestMapping("updatestatus")
	public String updatestatus(Operator o) {
		service.updatestatus(o);
		return "redirect:index";
	}
	@RequestMapping("updatepassword")
	public  @ResponseBody int updatepassword(Operator o,int id,HttpServletRequest req) {
		Operator opass= service.getById(id);
		if(o.getPassword().equals(opass.getPassword())) {
			service.updatepassword(o);
			Operator opass2= service.getById(id);
			req.getSession().setAttribute("operator", opass2);
			return 1;
		}else {
			return 0;
		}
	}

	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
		return "redirect:index";
	}
	

	@RequestMapping("deleteall")
	public  @ResponseBody Ids deleteall(Ids i) {
		// SqlHelper.executeUpdate("delete from quesbal where id in ("+ids+") ");
		service.deleteall(i);
		return new Ids(null);
	}

	@RequestMapping("add")
	public String add(ModelMap m) {
		m.put("sexstatus", Operator.sexstatus);
		m.put("powerstatus", Operator.powerstatus);
		m.put("workstatus", Operator.workstatus);
		return "operator/edit";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m) {
		m.put("info", service.getById(id));
		return add(m);
	}
	@RequestMapping("info")
	public String info(int id, ModelMap m) {
		m.put("info", service.getById(id));
		return addinfo(m);
	}
	@RequestMapping("addinfo")
	public String addinfo(ModelMap m) {
		m.put("sexstatus", Operator.sexstatus);
		m.put("powerstatus", Operator.powerstatus);
		m.put("workstatus", Operator.workstatus);
		return "operator/info";
	}
}
