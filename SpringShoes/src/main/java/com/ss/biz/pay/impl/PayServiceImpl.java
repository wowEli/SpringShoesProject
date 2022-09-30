package com.ss.biz.pay.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.biz.pay.PayService;
import com.ss.biz.pay.PayVO;


@Service("payService")
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDAO payDAO;

	@Override
	public void insertPay(PayVO vo) {
		payDAO.insertPay(vo);
	}

	@Override
	public List<PayVO> selectAllPay(PayVO vo) {
		return payDAO.selectAllPay(vo);
	}
}
