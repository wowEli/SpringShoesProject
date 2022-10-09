package com.ss.biz.shoes;

import java.util.List;

public interface ShoesService {
	public void updateShoes(ShoesVO vo, int size);
	public ShoesVO selectOneShoes(ShoesVO vo);
	public List<ShoesVO> selectShoes_Color(ShoesVO vo);
	public List<ShoesVO> selectShoes_Size(ShoesVO vo);
	public List<ShoesVO> selectAllShoes(ShoesVO vo);
	public List<ShoesVO> filterSearch(ShoesVO vo);
	
}
