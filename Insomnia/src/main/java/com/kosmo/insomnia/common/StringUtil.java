package com.kosmo.insomnia.common;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Iterator;
import java.util.Vector;

public class StringUtil {

	//숫자에 1000단위로 ,붙여주는 메서드 String, int 다 받음
	public static String insertCommaString(String numStr) {
		return insertCommaString(Integer.parseInt(numStr));
	}//String

	//int형도 받을 수 있도록 오버로딩
	public static String insertCommaString(int num) {
		Vector split = new Vector();
		while(true) {
			split.add(num % 1000);
			int mod = num % 1000;
			num = num / 1000;
			
			if(num == 0) 
				break;
		}//while
		
		StringBuffer resultString = new StringBuffer();
		Collections.reverse(split);
		Iterator iter = split.iterator();
		while(iter.hasNext()) {
			resultString.append(iter.next()+",");
		}//
		return new String(resultString.deleteCharAt(resultString.length()-1));
	}//
	
	//String 형 날짜 받아와서 출력할 형식으로 변환하기
	//제대로 된 결과가 나오지 않을 시 에러메세지와 null반환
	//ex) getStringDate("2019-04-23 00:00:00", "yyyy-MM-dd HH:mm:ss", "yy/MM/dd");
	public static String getStringDate(String dateString, String beforePattern, String resultPattern) {
		SimpleDateFormat resultSdf = new SimpleDateFormat(resultPattern);
		SimpleDateFormat parseSdf = new SimpleDateFormat(beforePattern);
		String result = null;
		try {
			result = resultSdf.format(parseSdf.parse(dateString));
		}catch(Exception e) {System.out.println("형식에 맞지 않은 String Pattern");}
		
		return result;
	}////getStringDate
	
}//class




