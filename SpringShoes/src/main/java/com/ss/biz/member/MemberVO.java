package com.ss.biz.member;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private int shoesSize;
	private String maddress;
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
	public int getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
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
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphone=" + mphone + ", shoesSize="
				+ shoesSize + ", maddress=" + maddress + ", tier=" + tier + ", role=" + role + "]";
	}
	

	
}
