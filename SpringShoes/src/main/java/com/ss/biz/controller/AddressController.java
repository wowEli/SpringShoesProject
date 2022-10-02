package com.ss.biz.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.address.AddressVO;
import com.ss.biz.address.impl.AddressDAO;

@Controller
public class AddressController {
	
	@RequestMapping(value="/insertA.do", method=RequestMethod.POST)  //����� �߰�
	public String insertAddress(AddressVO aVO, AddressDAO aDAO) { //�������������� ������� �߰��Ѵٱ� ����
		aDAO.insertAddress(aVO);
		return "myPage.do";	//������� �߰��ϸ� ������������ �̵�
	}
	
	@RequestMapping(value="/deleteA.do", method=RequestMethod.POST) //����� ����
	public String deleteAddress(AddressVO aVO, AddressDAO aDAO) {  //�������������� ������� �����Ѵٱ� ����
		aDAO.deleteAddress(aVO);
		return "myPage.do";
	}
	
	@RequestMapping(value="/selectAllA.do", method=RequestMethod.POST) //����� ��ü ����
	public void name(AddressVO aVO, AddressDAO aDAO, Model model) {	//�ֹ��ϱ⿡�� ����� ��ϵ� ������ �� ��� ����
		List<AddressVO> aDatas = aDAO.selectAllAddress(aVO);
		model.addAttribute("aDatas", aDatas);		//��ȯ ��?
	}
}
