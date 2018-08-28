package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Shopcar;
import util.SearchInfo;

@Repository
public interface Shopcar_dao {
	
	@Select("select shopcar.* ,product.fullname pname,user.email uname from shopcar inner join product inner join user "
			+ "on shopcar.product_id=product.id and shopcar.user_id=user.id ${where} ${limit} ")
	public List<Shopcar> select(SearchInfo info);
	
	@Delete("delete from shopcar where id=#{id}")
	public void delete(int id);
	
	@Select("select * from shopcar where id=#{id}")
	public Shopcar getById(int id);

	
}