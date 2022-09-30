package com.ss.biz.shoes;

public class ShoesSampleVO {
	private int samplepk; //pk
	private String shoesName; //신발 이름(기본검색)
	private int price; //가격(범위 슬라이드)
	private String brand; //브랜드(필터검색)
	
	public int getSamplepk() {
		return samplepk;
	}
	public void setSamplepk(int samplepk) {
		this.samplepk = samplepk;
	}
	public String getShoesName() {
		return shoesName;
	}
	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	@Override
	public String toString() {
		return "ShoesSampleVO [samplepk=" + samplepk + ", shoesName=" + shoesName + ", price=" + price + ", brand="
				+ brand + "]";
	}
	
}
