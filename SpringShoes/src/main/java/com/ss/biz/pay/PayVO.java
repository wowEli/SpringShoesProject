package com.ss.biz.pay;

public class PayVO {
	private int ppk; // pk
	private String mid; // member pk
	private int sizepk; // shoessize pk
	private String address; // 배송지
	private int pnum; //영수증 번호
	private String payday; //구매 날짜
	
	// JAVA에서만 쓸 변수
	private boolean flag; // 1회 후기용 변수

	public int getPpk() {
		return ppk;
	}

	public void setPpk(int ppk) {
		this.ppk = ppk;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getSizepk() {
		return sizepk;
	}

	public void setSizepk(int sizepk) {
		this.sizepk = sizepk;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPayday() {
		return payday;
	}

	public void setPayday(String payday) {
		this.payday = payday;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "PayVO [ppk=" + ppk + ", mid=" + mid + ", sizepk=" + sizepk + ", address=" + address + ", pnum=" + pnum
				+ ", payday=" + payday + ", flag=" + flag + "]";
	}
	
	
	
}
