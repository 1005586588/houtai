package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Operator_dao;
import entity.Operator;
import service.Operator_service;
import util.Ids;
import util.SearchInfo;

@Service
public class Operator_serviceImpl implements Operator_service{

	@Autowired
	Operator_dao dao;
	
	public List<Operator> select(SearchInfo info) {
		return dao.select(info);
	}

	public void insert(Operator o) {
		dao.insert(o);
	}

	public void update(Operator o) {
		dao.update(o);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public Operator getById(int id) {
		return dao.getById(id);
	}

	public void updatestatus(Operator o) {
		dao.updatestatus(o);
	}

	public void deleteall(Ids i) {
		dao.deleteall(i);
	}

	public Operator login(Operator o) {
		return dao.login(o);
	}

	public void updatepassword(Operator o) {
		dao.updatepassword(o);
		
	}

	
}
