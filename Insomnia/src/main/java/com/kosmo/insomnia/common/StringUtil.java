package com.kosmo.insomnia.common;

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
	
}//class




