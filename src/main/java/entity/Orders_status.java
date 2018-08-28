package entity;

public class Orders_status {
	
	public static String[] sstatus = { "0未支付","1已支付","2已发货","3已收货","4已退货","5已取消" };
	
	int id ;
	String date;
	double amount;
	String info;
	int num;
	int orders_id;
	int dest_status;
	String comments;
	
	
	public String  getSa() {
		return sstatus[dest_status];
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


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public int getOrders_id() {
		return orders_id;
	}


	public void setOrders_id(int orders_id) {
		this.orders_id = orders_id;
	}


	public int getDest_status() {
		return dest_status;
	}


	public void setDest_status(int dest_status) {
		this.dest_status = dest_status;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	
	
	
	
}
