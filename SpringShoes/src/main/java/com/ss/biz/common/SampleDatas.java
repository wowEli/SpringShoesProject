package com.ss.biz.common;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SampleDatas {
	public static void main(String[] args) {
		
		
		   final String SampleUrl="https://tmddhks2425.tistory.com/2";
		   final String ColorUrl="https://tmddhks2425.tistory.com/3";
		      Document SampleDoc=null;
		   	  Document ColorDoc=null;
		      try {
		    	 SampleDoc = Jsoup.connect(SampleUrl).get(); 
		         ColorDoc = Jsoup.connect(ColorUrl).get();
		         String str1 ="tbody > tr > td";
		         String str2 ="tbody > tr > td > figure > span > img";
		         
		         Elements eles1 = SampleDoc.select(str1);
		         Elements eles2	= SampleDoc.select(str2);
		         Elements eles3 = ColorDoc.select(str1);  
		         Elements eles4	= ColorDoc.select(str2);
		         //sample신발 크롤링
		         Iterator<Element> itr1 = eles1.iterator();
		         Iterator<Element> itr2 = eles2.iterator();
		         //color신발 크롤링
		         Iterator<Element> itr3 = eles3.iterator();
		         Iterator<Element> itr4 = eles4.iterator();
		         while(itr1.hasNext()) {
		        	 System.out.println(itr1.next().text());
		        	 System.out.println(itr1.next().text());
		        	 System.out.println(itr1.next().text());
		        	 itr1.next();
		        	 
		         }
		         System.out.println("============SampleShoes Crawling complete================");
		         System.out.println();
		         System.out.println();
		         while(true) {
		        	 System.out.println(itr3.next().text());
		        	 System.out.println(itr3.next().text());
		        	 itr3.next();
		        	 System.out.println(itr4.next().attr("src"));
		        	 if(itr4.hasNext()==false) {
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
