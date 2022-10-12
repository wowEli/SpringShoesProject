package com.ss.biz.address.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ss.biz.address.AddressVO;

@Repository("addressDAO")
public class AddressDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String sql_insert="INSERT INTO ADDRESS(ANAME,ADDRESS,MID) VALUES(?,?,?)";

	final String sql_delete="DELETE FROM ADDRESS WHERE APK=?";
	final String sql_selectAll="SELECT * FROM ADDRESS WHERE MID = ?";
	
	
	public void insertAddress(AddressVO vo) {
		jdbcTemplate.update(sql_insert,vo.getAname(),vo.getAddress(),vo.getMid());
	}
	
	public void deleteAddress(AddressVO vo) {
		jdbcTemplate.update(sql_delete,vo.getApk());
	}
	
	public List<AddressVO> selectAllAddress(AddressVO vo) {
		Object[] args = { vo.getMid()};
		return jdbcTemplate.query(sql_selectAll,args, new AddressRowMapper());
	}
}

class AddressRowMapper implements RowMapper<AddressVO> {

	@Override
	public AddressVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		AddressVO data = new AddressVO();
		data.setApk(rs.getInt("APK"));
		data.setAname(rs.getString("ANAME"));
		data.setMid(rs.getString("MID"));
		data.setAddress(rs.getString("ADDRESS"));
		return data;

	}

}
