package com.ss.biz.member;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private int shoesSize;
	private String mpostcode;
	private String maddress;
	private String mdetailAddress;
	private String mextraAddress;
	private String tier;
	private String role;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMpostcode() {
		return mpostcode;
	}
	public void setMpostcode(String mpostcode) {
		this.mpostcode = mpostcode;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getMdetailAddress() {
		return mdetailAddress;
	}
	public void setMdetailAddress(String mdetailAddress) {
		this.mdetailAddress = mdetailAddress;
	}
	public String getMextraAddress() {
		return mextraAddress;
	}
	public void setMextraAddress(String mextraAddress) {
		this.mextraAddress = mextraAddress;
	}
	public int getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphone=" + mphone + ", shoesSize="
				+ shoesSize + ", mpostcode=" + mpostcode + ", maddress=" + maddress + ", mdetailAddress="
				+ mdetailAddress + ", mextraAddress=" + mextraAddress + ", tier=" + tier + ", role=" + role + "]";
	}
	
}
