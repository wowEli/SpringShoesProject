package com.ss.biz.address;


public class AddressVO {
	private int apk;
	private String aname;
	private String mid;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	
	
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
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	
	@Override
	public String toString() {
		return "AddressVO [apk=" + apk + ", aname=" + aname + ", mid=" + mid + ", postcode=" + postcode + ", address="
				+ address + ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + "]";
	}
	
	
}
