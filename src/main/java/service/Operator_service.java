package service;

import java.util.List;

import entity.Operator;
import util.Ids;
import util.SearchInfo;

public interface Operator_service {
	
	public List<Operator> select(SearchInfo info);
	
	public void insert(Operator o);

	public void update(Operator o);
	
	public void updatestatus(Operator o);
	
	public void delete(int id);
	
	public void deleteall(Ids i);
	
	public Operator getById(int id);
	
	public Operator login(Operator o);
	
	public void updatepassword(Operator o);
}
