package jeju.increpas.www.vo;

public class FileVO {
	private int rpno, pno, rtno;
	private long rpsize;
	private String rponame, rpsname, rpdir;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
	}
	public String getRponame() {
		return rponame;
	}
	public void setRponame(String rponame) {
		this.rponame = rponame;
	}
	public String getRpsname() {
		return rpsname;
	}
	public void setRpsname(String rpsname) {
		this.rpsname = rpsname;
	}
	public long getRpsize() {
		return rpsize;
	}
	public void setRpsize(long rpsize) {
		this.rpsize = rpsize;
	}
	public String getRpdir() {
		return rpdir;
	}
	public void setRpdir(String rpdir) {
		this.rpdir = rpdir;
	}
	public int getRtno() {
		return rtno;
	}
	public void setRtno(int rtno) {
		this.rtno = rtno;
	}
	@Override
	public String toString() {
		return "FileVO [rpno=" + rpno + ", pno=" + pno + ", rtno=" + rtno + ", rpsize=" + rpsize + ", rponame="
				+ rponame + ", rpsname=" + rpsname + ", rpdir=" + rpdir + "]";
	}
	
}
