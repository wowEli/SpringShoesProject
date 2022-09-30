package com.ss.biz.common;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.ss.biz.shoes.ShoesColorVO;
import com.ss.biz.shoes.ShoesSampleVO;
import com.ss.biz.shoes.impl.ShoesDAO;

public class CrawlingConsole {

	public static void main(String[] args) {
		ShoesDAO shoesDAO = new ShoesDAO();

		final String SampleUrl = "https://tmddhks2425.tistory.com/2";
		final String ColorUrl = "https://tmddhks2425.tistory.com/3";
		Document SampleDoc = null;
		Document ColorDoc = null;
		try {
			SampleDoc = Jsoup.connect(SampleUrl).get();
			ColorDoc = Jsoup.connect(ColorUrl).get();
			String str1 = "tbody > tr > td";
			String str2 = "tbody > tr > td > figure > span > img";

			Elements eles1 = SampleDoc.select(str1);
			Elements eles2 = SampleDoc.select(str2);
			Elements eles3 = ColorDoc.select(str1);
			Elements eles4 = ColorDoc.select(str2);
			// sample신발 크롤링
			Iterator<Element> itr1 = eles1.iterator();
			Iterator<Element> itr2 = eles2.iterator();
			// color신발 크롤링
			Iterator<Element> itr3 = eles3.iterator();
			Iterator<Element> itr4 = eles4.iterator();

			while (itr1.hasNext()) {
				String brand = itr1.next().text();
				String name = itr1.next().text();
				int price = Integer.parseInt(itr1.next().text());
				itr1.next();

				System.out.println("brand : " + brand);
				System.out.println("name : " + name);
				System.out.println("price : " + price);

				ShoesSampleVO vo = new ShoesSampleVO();

				vo.setBrand(brand);
				vo.setShoesName(name);
				vo.setPrice(price);
				shoesDAO.insertSampleShoes(vo);

			}
			System.out.println("============SampleShoes Crawling complete================");
			System.out.println();
			System.out.println();
			while (true) {
				int samplePK = Integer.parseInt(itr3.next().text());
				String color = itr3.next().text();
				itr3.next();
				String shoesImg = itr4.next().text();

				System.out.println("samplePK : " + samplePK);
				System.out.println("color : " + color);
				System.out.println("shoesImg : " + shoesImg);

				ShoesColorVO vo = new ShoesColorVO();
				vo.setSamplepk(samplePK);
				vo.setColor(color);
				vo.setShoesImg(shoesImg);

				shoesDAO.insertColorShoes(vo);

				if (itr4.hasNext() == false) {
					break;
				}
			}
			System.out.println("================ColorShoes Crawling complete================");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
