package com.ss.biz.address;


public class AddressVO {
	private int apk;
	private String aname;
	private String mid;
	private String address;
	public int getApk() {
		return apk;
	}
	public void setApk(int apk) {
		this.apk = apk;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "AddressVO [apk=" + apk + ", aname=" + aname + ", mid=" + mid + ", address=" + address + "]";
	}
	
}
