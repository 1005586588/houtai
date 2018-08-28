package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Operator;
import util.Ids;
import util.SearchInfo;

@Repository
public interface Operator_dao {
	
	@Select("select * from operator ${where} ${limit} ")
	public List<Operator> select(SearchInfo info);
	
	@Insert("insert into operator (nike,password,name,sex,tel,power,status,comments) values(#{nike},#{password},#{name},#{sex},#{tel},#{power},#{status},#{comments})")
	public void insert(Operator o);

	@Update("update operator set nike=#{nike},password=#{password},name=#{name},sex=#{sex},tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id=#{id}")
	public void update(Operator o);
	
	@Update("update operator set status=#{status} where id=#{id}")
	public void updatestatus(Operator o);
	
	@Delete("delete from operator where id=#{id}")
	public void delete(int id);
	
	@Delete("delete from operator where id in ${ids}")
	public void deleteall(Ids i);
	
	@Select("select * from operator where id=#{id}")
	public Operator getById(int id);

	@Select("select * from operator where nike=#{nike}")
	public Operator login(Operator o);

	@Update("update operator set password=#{newpassword} where id=#{id}")
	public void updatepassword(Operator o);
}