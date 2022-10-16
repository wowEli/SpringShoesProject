package com.ss.biz.pay;

public class PayVO {
	private int ppk; // pk
	private String mid; // member pk
	private int sizepk; // shoessize pk
	private String address; // 배송지
	private String payday; // 구매 날짜
	
	// JAVA에서만 쓸 변수
	private boolean flag; // 1회 후기용 변수
	
	// 조인을 통해 사용되는 변수
	private int shoesSize;
	private String shoesColor;
	private String shoesImg;
	private String shoesName;
	private int shoesPrice;
	private String shoesBrand;
	private int colorpk;
	
	public int getColorpk() {
		return colorpk;
	}
	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}
	public int getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}
	public String getShoesColor() {
		return shoesColor;
	}
	public void setShoesColor(String shoesColor) {
		this.shoesColor = shoesColor;
	}
	public String getShoesImg() {
		return shoesImg;
	}
	public void setShoesImg(String shoesImg) {
		this.shoesImg = shoesImg;
	}
	public String getShoesName() {
		return shoesName;
	}
	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}
	public int getShoesPrice() {
		return shoesPrice;
	}
	public void setShoesPrice(int shoesPrice) {
		this.shoesPrice = shoesPrice;
	}
	public String getShoesBrand() {
		return shoesBrand;
	}
	public void setShoesBrand(String shoesBrand) {
		this.shoesBrand = shoesBrand;
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
		return "PayVO [ppk=" + ppk + ", mid=" + mid + ", sizepk=" + sizepk + ", address=" + address + ", payday="
				+ payday + ", flag=" + flag + ", shoesSize=" + shoesSize + ", shoesColor=" + shoesColor + ", shoesImg="
				+ shoesImg + ", shoesName=" + shoesName + ", shoesPrice=" + shoesPrice + ", shoesBrand=" + shoesBrand
				+ ", colorpk=" + colorpk + "]";
	}
	
	
}
