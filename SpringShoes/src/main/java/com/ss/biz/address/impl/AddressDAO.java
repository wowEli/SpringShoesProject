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
	
	final String sql_insert="INSERT INTO ADDRESS(ANAME,POSTCODE,ADDRESS,DETAILADDRESS,EXTRAADDRESS,MID) VALUES(?,?,?,?,?,?)";
//	-	apk INT PRIMARY KEY AUTO_INCREMENT
//	-	aname VARCHAR(20) – 주소이름
//	-	mid – FK (MEMBER PK)
//	-	postcode VARCHAR(20) – 우편번호 (0으로 시작 될 수도있음)
//	-	address VARCHAR(100) - 주소
//	-	detailAddress VARCHAR(100) – 상세주소
//	-	extraAddress VARCHAR(50) – 참고항목

	final String sql_delete="DELETE FROM ADDRESS WHERE APK=?";
	final String sql_selectAll="SELECT * FROM ADDRESS";
	
	
	public void insertAddress(AddressVO vo) {
		jdbcTemplate.update(sql_insert,vo.getAname(),vo.getPostcode(),vo.getAddress(),vo.getDetailAddress(),vo.getExtraAddress(),vo.getMid());
	}
	
	public void deleteAddress(AddressVO vo) {
		jdbcTemplate.update(sql_delete,vo.getApk());
	}
	public List<AddressVO> selectAllAddress(AddressVO vo) {
		return jdbcTemplate.query(sql_selectAll, new AddressRowMapper());
	}
}

class AddressRowMapper implements RowMapper<AddressVO> {

	@Override
	public AddressVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//		-	apk INT PRIMARY KEY AUTO_INCREMENT
//		-	aname VARCHAR(20) – 주소이름
//		-	mid – FK (MEMBER PK)
//		-	postcode VARCHAR(20) – 우편번호 (0으로 시작 될 수도있음)
//		-	address VARCHAR(100) - 주소
//		-	detailAddress VARCHAR(100) – 상세주소
//		-	extraAddress VARCHAR(50) – 참고항목
		AddressVO data = new AddressVO();
		data.setApk(rs.getInt("APK"));
		data.setAname(rs.getString("ANAME"));
		data.setMid(rs.getString("MID"));
		data.setPostcode(rs.getString("POSTCODE"));
		data.setAddress(rs.getString("ADDRESS"));
		data.setDetailAddress(rs.getString("DETAILADDRESS"));
		data.setExtraAddress(rs.getString("EXTRAADDRESS"));
		return data;

	}

}
