package com.ss.biz.shoes;

import java.util.Arrays;

// 자바에서만 사용할 shoesVO
public class ShoesVO {
	private String shoesName;
	private String brand;
	private int price;
	private String shoesColor;
	private String shoesImg;
	private int colorpk;
	private int sizepk;
	private int shoesSize;
	private int shoesCnt;
	
	private String searchContent; // 일반 검색
	
	private String filterColor; //  필터 검색 신발 색상
	private String filterBrand; // 필터 검색 신발 브랜드
	private int filterLowPrice; // 필터 검색 낮은 가격 순
	private int filterHighPrice; // 필터 검색 높은 가격 순
	private int[] filterSize; // 필터 검색 사이즈 여러개 값 가져오기
	
	
	public int getSizepk() {
		return sizepk;
	}
	public void setSizepk(int sizepk) {
		this.sizepk = sizepk;
	}
	public int[] getFilterSize() {
		return filterSize;
	}
	public void setFilterSize(int[] filterSize) {
		this.filterSize = filterSize;
	}
	public int getShoesCnt() {
		return shoesCnt;
	}
	public void setShoesCnt(int shoesCnt) {
		this.shoesCnt = shoesCnt;
	}
	public int getShoesSize() {
		return shoesSize;
	}
	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
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
	public int getColorpk() {
		return colorpk;
	}
	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}
	public String getFilterColor() {
		return filterColor;
	}
	public void setFilterColor(String filterColor) {
		this.filterColor = filterColor;
	}
	public String getFilterBrand() {
		return filterBrand;
	}
	public void setFilterBrand(String filterBrand) {
		this.filterBrand = filterBrand;
	}
	public int getFilterLowPrice() {
		return filterLowPrice;
	}
	public void setFilterLowPrice(int filterLowPrice) {
		this.filterLowPrice = filterLowPrice;
	}
	public int getFilterHighPrice() {
		return filterHighPrice;
	}
	public void setFilterHighPrice(int filterHighPrice) {
		this.filterHighPrice = filterHighPrice;
	}
	@Override
	public String toString() {
		return "ShoesVO [shoesName=" + shoesName + ", brand=" + brand + ", price=" + price + ", shoesColor="
				+ shoesColor + ", shoesImg=" + shoesImg + ", colorpk=" + colorpk + ", sizepk=" + sizepk + ", shoesSize="
				+ shoesSize + ", shoesCnt=" + shoesCnt + ", searchContent=" + searchContent + ", filterColor="
				+ filterColor + ", filterBrand=" + filterBrand + ", filterLowPrice=" + filterLowPrice
				+ ", filterHighPrice=" + filterHighPrice + ", filterSize=" + Arrays.toString(filterSize) + "]";
	}
}
