package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import entity.Orders;
import util.SearchInfo;

@Repository
public interface Orders_dao {
	
	@Select("select Orders.* ,address.zone aname,user.email uname from Orders inner join address inner join user "
			+ "on Orders.address_id=address.id and Orders.user_id=user.id ${where} ${limit} ")
	public List<Orders> select(SearchInfo info);
	
	@Delete("delete from Orders where id=#{id}")
	public void delete(int id);
	
	@Select("select * from Orders where id=#{id}")
	public Orders getById(int id);

	@Update("update orders set status=#{status} where id=#{id}")
	public void updatestatus(Orders o);
	
}