package javabean;
public class passenger {   //顾客类
	private String p_id=null;//身份证号
	private String p_name=null;//姓名
	private String p_tel=null;//电话
	private String p_sex=null;//性别
	private String p_work=null;//工作单位
	private String p_pwd=null;//密码

	
	public String get_p_id() {
		return p_id;
	}
	public void set_p_id(String p_id) {
		this.p_id = p_id;
	}
	public String get_p_name() {
		return p_name;
	}
	public void set_p_name(String p_name) {
		this.p_name = p_name;
	}
	public String get_p_tel() {
		return p_tel;
	}
	public void set_p_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public String get_p_sex() {
		return p_sex;
	}
	public void set_p_sex(String p_sex) {
		this.p_sex = p_sex;
	}
	public String get_p_work() {
		return p_work;
	}
	public void set_p_work(String p_work) {
		this.p_work = p_work;
	}
	public String get_p_pwd() {
		return p_pwd;
	}
	public void set_p_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}
}

