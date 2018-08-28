package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Type;
import service.Type_service;
import util.JsonUtil.jsonInfo;
import util.SearchInfo;

@Controller
@RequestMapping("type")
public class Type_Controller {

	@Autowired
	Type_service service;
	
	@RequestMapping("index")
	public void index(Integer parentid, SearchInfo info, ModelMap m) {
		m.put("typelist",service.select(new SearchInfo(" where type.parentid=0 ",false)));
		
		if(parentid==null)parentid=0;
		
		m.put("parentid", parentid);
		if(parentid>0) {
			Type t=service.getById(parentid);
			m.put("name", t.getName());
			String path="/<a href=\"index?parentid="+t.getId()+"\">"+t.getName()+"</a>";
			if(t.getParentid()>0) {
				t=service. getById(t.getParentid());
				path="/<a href=\"index?parentid="+t.getId()+"\">"+t.getName()+"</a>"+path;
			}
			path="<a href=\"index?parentid=0\">根节点</a>"+path;
			m.put("path", path);
		}else {
			m.put("name", "根节点");
			m.put("path","<a href=\"index?parentid=0\">根节点</a>");
		}
		
		info.setCanPage(false);
		info.setWhere("where type.parentid="+parentid);
		m.put("list", service.select(info));
	}
	
	@RequestMapping("insert")
	public @ResponseBody jsonInfo insert(Type t) {
		service.insert(t);
		return new jsonInfo(1, "");
	}

	@RequestMapping("update")
	public @ResponseBody jsonInfo update(Type t) {
		service.update(t);
		return new jsonInfo(1, "");
	}

	@RequestMapping("delete")
	public String delete(int id,int parentid) {
		service.delete(id);
		return "redirect:index?parentid="+parentid;
	}

	@RequestMapping("add")
	public String add(int parentid,ModelMap m) {
		m.put("parentid", parentid);
		return "type/edit";
	}

	@RequestMapping("edit")
	public String edit(int id, ModelMap m) {
		m.put("info", service.getById(id));
		return "type/edit";
	}

}
