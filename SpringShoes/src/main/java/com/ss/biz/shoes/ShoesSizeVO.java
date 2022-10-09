package com.ss.biz.shoes;

import java.util.Arrays;

public class ShoesSizeVO {
	private int sizepk;	// pk
	private int colorpk; // shoescoloer pk
	private int size; // 신발 사이즈
	private int cnt; //신발재고
	
	private int[] sizeArray;
	
	public int[] getSizeArray() {
		return sizeArray;
	}
	public void setSizeArray(int[] sizeArray) {
		this.sizeArray = sizeArray;
	}
	public int getSizepk() {
		return sizepk;
	}
	public void setSizepk(int sizepk) {
		this.sizepk = sizepk;
	}
	public int getColorpk() {
		return colorpk;
	}
	public void setColorpk(int colorpk) {
		this.colorpk = colorpk;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ShoesSizeVO [sizepk=" + sizepk + ", colorpk=" + colorpk + ", size=" + size + ", cnt=" + cnt
				+ ", sizeArray=" + Arrays.toString(sizeArray) + "]";
	}
	
}
