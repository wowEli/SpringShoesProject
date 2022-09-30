package com.ss.biz.address.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.biz.address.AddressService;
import com.ss.biz.address.AddressVO;

@Service("addressService")
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDAO addressDAO;
	
	@Override
	public void insertAddress(AddressVO vo) {
			addressDAO.insertAddress(vo);
	}

	@Override
	public void deleteAddress(AddressVO vo) {
		addressDAO.deleteAddress(vo);
	}

	@Override
	public List<AddressVO> selectAllAddress(AddressVO vo) {
		return addressDAO.selectAllAddress(vo);
	}

}
