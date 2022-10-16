package com.ss.biz.pay.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.ss.biz.pay.PayVO;

@Repository("payDAO")
public class PayDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	final String sql_insert="INSERT INTO PAY(MID,SIZEPK,ADDRESS) VALUES(?,?,?)";

	final String sql_selectAll="SELECT P.PPK, P.MID, P.SIZEPK, P.ADDRESS, P.PAYDAY, SS.SIZE, SC.COLORPK, SC.COLOR, SC.SHOESIMG, SSP.SHOESNAME, SSP.PRICE, SSP.BRAND FROM PAY P "
			+ "INNER JOIN SHOESSIZE SS ON P.SIZEPK = SS.SIZEPK "
			+ "INNER JOIN SHOESCOLOR SC ON SS.COLORPK = SC.COLORPK "
			+ "INNER JOIN SHOESSAMPLE SSP ON SC.SAMPLEPK = SSP.SAMPLEPK "
			+ "WHERE P.MID= ? "
			+ "ORDER BY PPK DESC";
	
	public boolean insertPay(PayVO vo) {
		jdbcTemplate.update(sql_insert,vo.getMid(),vo.getSizepk(),vo.getAddress());
		return false;
	}
	
	public List<PayVO> selectAllPay(PayVO vo){
		Object[] args= {vo.getMid()};
		return jdbcTemplate.query(sql_selectAll, args, new PayRowMapper());
	}
	
}
class PayRowMapper implements RowMapper<PayVO> {

		@Override
		public PayVO mapRow(ResultSet rs, int rowNum) throws SQLException {

			PayVO data=new PayVO();
			data.setPpk(rs.getInt("PPK"));
			data.setMid(rs.getString("MID"));
			data.setSizepk(rs.getInt("SIZEPK"));
			data.setAddress(rs.getString("ADDRESS"));
			data.setPayday(rs.getString("PAYDAY"));
			data.setShoesSize(rs.getInt("SIZE"));
			data.setShoesColor(rs.getString("COLOR"));
			data.setShoesImg(rs.getString("SHOESIMG"));
			data.setShoesName(rs.getString("SHOESNAME"));
			data.setShoesPrice(rs.getInt("PRICE"));
			data.setShoesBrand(rs.getString("BRAND"));
			data.setColorpk(rs.getInt("COLORPK"));
			
			return data;
		}
		
}
