package entity;

import util.MD5;

public class Operator {

	public  static String [] sexstatus={"男","女"};
	public  static String [] powerstatus={"管理员","操作员"};
	public  static String [] workstatus={"正常","离职"};
	
	
	String newpassword;
	int id;
	String nike;
	String password;
	String name;
	int sex;
	String tel;
	int power;
	int status;
	String comments;
	
	
	public String getMd5() {
		return MD5.MD5(password) ;
	}
	
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String  getSexa() {
		return sexstatus[sex];
	}
	public String  getPowera() {
		return powerstatus[power];
	}
	public String  getStatusa() {
		return workstatus[status];
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNike() {
		return nike;
	}
	public void setNike(String nike) {
		this.nike = nike;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
