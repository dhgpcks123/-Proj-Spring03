
package jeju.increpas.www.vo;

import java.sql.*;
import java.text.*;

public class MemberVO {
   private int mno;
   private String id, mname, pw, mail, tel, gen, isshow, joindate, blood1, blood2, sos, msg, birth, rel, addmsg;
   private Date joinDate;
   
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
   public String getGen() {
      return gen;
   }
   public void setGen(String gen) {
      this.gen = gen;
   }
   public String getIsshow() {
      return isshow;
   }
   public void setIsshow(String isshow) {
      this.isshow = isshow;
   }
   public String getJoindate() {
      return joindate;
   }
   public void setJoindate() {
      SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd"); 
      this.joindate = form.format(joinDate); 
   }
   public void setJoindate(String joindate) {
      this.joindate = joindate;
   }
   public String getBlood1() {
      return blood1;
   }
   public void setBlood1(String blood1) {
      this.blood1 = blood1;
   }
   public String getBlood2() {
      return blood2;
   }
   public void setBlood2(String blood2) {
      this.blood2 = blood2;
   }
   public String getSos() {
      return sos;
   }
   public void setSos(String sos) {
      this.sos = sos;
   }
   public String getMsg() {
	   return msg;
   }
   public void setMsg(String msg) {
	   this.msg = msg;
   }
   public Date getJoinDate() {
	   return joinDate;
   }
   public void setJoinDate(Date joinDate) {
      this.joinDate = joinDate;
      setJoindate();
   }
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
	public String getAddmsg() {
		return addmsg;
	}
	public void setAddmsg(String addmsg) {
		this.addmsg = addmsg;
	}
@Override
public String toString() {
	return "MemberVO [mno=" + mno + ", id=" + id + ", mname=" + mname + ", pw=" + pw + ", mail=" + mail + ", tel=" + tel
			+ ", gen=" + gen + ", isshow=" + isshow + ", joindate=" + joindate + ", blood1=" + blood1 + ", blood2="
			+ blood2 + ", sos=" + sos + ", msg=" + msg + ", addmsg=" + addmsg + ", joinDate=" + joinDate + ", birth=" + birth + ", getMno()="
			+ getMno() + ", getId()=" + getId() + ", getMname()=" + getMname() + ", getPw()=" + getPw() + ", getMail()="
			+ getMail() + ", getTel()=" + getTel() + ", getGen()=" + getGen() + ", getIsshow()=" + getIsshow()
			+ ", getJoindate()=" + getJoindate() + ", getBlood1()=" + getBlood1() + ", getBlood2()=" + getBlood2()
			+ ", getSos()=" + getSos() + ", getMsg()=" + getMsg() + "getAddmsg()=" + getAddmsg() + ", getJoinDate()=" + getJoinDate() + ", getBirth()="
			+ getBirth() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
			+ super.toString() + "]";
}
   
}