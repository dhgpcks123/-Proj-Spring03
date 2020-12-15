package jeju.increpas.www.vo;

import java.text.*;
import java.util.*;

public class MemberVO {
	private int mno;
	private String id, mname, pw, mail, tel, date, gen, blood1, bloold2, sos;
	private Date joindate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDate() {
		return date;
	}
	public void setDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		this.date = form.format(joindate);
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getBlood1() {
		return blood1;
	}
	public void setBlood1(String blood1) {
		this.blood1 = blood1;
	}
	public String getBloold2() {
		return bloold2;
	}
	public void setBloold2(String bloold2) {
		this.bloold2 = bloold2;
	}
	public String getSos() {
		return sos;
	}
	public void setSos(String sos) {
		this.sos = sos;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
		setDate();
	}
	
}
