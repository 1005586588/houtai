package entity;

public class Orders {
	
	public static String[] sstatus = { "0未支付","1已支付","2已发货","3已收货","4已退货","5已取消" };
	public static String[] assessstatusa = { "已评价","未评价" };
	
	int id ;
	String date;
	double amount;
	String code;
	double nowamount;
	int address_id;
	int user_id;
	int  assessstatus;
	int status;
	String comments;
	String aname;
	String uname;
	
	
	public String  getSa() {
		return sstatus[status];
	}
	public String  getAssessstatusa() {
		return assessstatusa[assessstatus];
	}
	
	


	public int getAssessstatus() {
		return assessstatus;
	}
	public void setAssessstatus(int assessstatus) {
		this.assessstatus = assessstatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getNowamount() {
		return nowamount;
	}
	public void setNowamount(double nowamount) {
		this.nowamount = nowamount;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
}
