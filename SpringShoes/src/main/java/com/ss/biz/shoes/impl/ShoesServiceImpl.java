package com.ss.biz.shoes.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ss.biz.shoes.ShoesColorVO;
import com.ss.biz.shoes.ShoesSampleVO;
import com.ss.biz.shoes.ShoesService;

public class ShoesServiceImpl implements ShoesService{

	@Autowired // MemberDAO 타입의 객체가 메모리에 있어야지만 DI(의존성 주입) 가능함!
	private ShoesDAO shoesDAO; // 핵심로직을 수행할 객체
	
	@Override
	public void insertShoesSample(ShoesSampleVO vo) {
		shoesDAO.insertSampleShoes(vo);
		
	}

	@Override
	public void insertShoesColor(ShoesColorVO vo) {
		shoesDAO.insertColorShoes(vo);
	}

}
