package com.ss.biz.pay;

import java.util.List;

public interface PayService {
	public void insertPay(PayVO vo);
	public List<PayVO> selectAllPay(PayVO vo);
}
