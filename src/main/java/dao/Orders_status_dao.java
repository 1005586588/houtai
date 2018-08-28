package dao;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import entity.Orders;
import entity.Orders_status;

@Repository
public interface Orders_status_dao {
	
	@Insert("insert into Orders_status (orders_id,date,dest_status,info,num,amount,comments) values(#{orders_id},#{date},#{dest_status},#{info},#{num},#{amount},#{comments})")
	public void insert(Orders_status o);

}