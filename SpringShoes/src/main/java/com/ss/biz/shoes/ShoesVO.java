package com.ss.biz.shoes;

// 자바에서만 사용할 shoesVO
public class ShoesVO {
	private int colorpk;
	private String shoesName;
	private String brand;
	private int price;
	private String shoesColor;
	private String shoesImg;
	
	public int getColorpk() {
		return colorpk;
	}
	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}
	public String getShoesName() {
		return shoesName;
	}
	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getShoesImg() {
		return shoesImg;
	}
	public void setShoesImg(String shoesImg) {
		this.shoesImg = shoesImg;
	}
	public String getShoesColor() {
		return shoesColor;
	}
	public void setShoesColor(String shoesColor) {
		this.shoesColor = shoesColor;
	}
	@Override
	public String toString() {
		return "ShoesVO [colorpk=" + colorpk + ", shoesName=" + shoesName + ", brand=" + brand + ", price=" + price
				+ ", shoesColor=" + shoesColor + ", shoesImg=" + shoesImg + "]";
	}
	
}
