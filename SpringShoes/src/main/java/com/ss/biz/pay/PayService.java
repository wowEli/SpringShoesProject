package com.ss.biz.pay;

import java.util.List;

public interface PayService {
	public boolean insertPay(PayVO vo);
	public List<PayVO> selectAllPay(PayVO vo);
}
