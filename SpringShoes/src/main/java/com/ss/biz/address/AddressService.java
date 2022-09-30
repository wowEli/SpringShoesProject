package com.ss.biz.address;

import java.util.List;

public interface AddressService {
	void insertAddress(AddressVO vo);
	void deleteAddress(AddressVO vo);
	List<AddressVO> selectAllAddress(AddressVO vo);
}
