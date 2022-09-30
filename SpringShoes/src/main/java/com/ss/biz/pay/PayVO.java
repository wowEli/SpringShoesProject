package com.ss.biz.pay;

public class PayVO {
	private int ppk; // pk
	private String mid; // member pk
	private int sizepk; // shoessize pk
	private String address; // 배송지
	
	// JAVA에서만 쓸 변수
	private boolean flag; // 1회 후기용 변수
	
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
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
	@Override
	public String toString() {
		return "PayVO [ppk=" + ppk + ", mid=" + mid + ", sizepk=" + sizepk + ", address=" + address + ", flag=" + flag
				+ "]";
	}
	
}
