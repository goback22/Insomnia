package com.kosmo.insomnia.common;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.kosmo.insomnia.service.BandMusicDTO;

public class DTOUtil {
	
	//JSONObject or JSONArray를 쓰기 전에 
	//DTO 를 Map으로 변환해주는 메서드
	//Map을 DTO로 변환해주는 메서드

	public static Map convertDTOToMap(Object obj) {
		Map map = new HashMap();
		Field[] fields = obj.getClass().getDeclaredFields();
		for(int i=0; i < fields.length; i++) {
			fields[i].setAccessible(true);
			try {
				map.put(fields[i].getName(), fields[i].get(obj));
			}catch(Exception e) {e.printStackTrace();}
		}//for
		return map;
	}//convertObjectToMap
	
	
	
	public static Object convertMapToDTO(Map<String, Object> map, Object obj) {
		String keyAttribute = null;
		String setMethodString = "set";
		String methodString = null;
		Iterator itr = map.keySet().iterator();
		
		while(itr.hasNext()) {
			keyAttribute = (String) itr.next();
			methodString = setMethodString + keyAttribute.substring(0,1).toUpperCase()
					+ keyAttribute.substring(1);
			Method[] methods = obj.getClass().getDeclaredMethods();
			for(int i = 0; i<methods.length; i++) {
				if(methodString.equals(methods[i].getName())) {
					try {
						methods[i].invoke(obj, map.get(keyAttribute));
					}catch(Exception e) {e.printStackTrace();}//catch
				}//if
			}///for
		}//while
		return obj;
	}///convert Map To DTO
	
	
	///BandMusicDTO형 리스트를 받아 인덱스를 저장한다.
	public static List<BandMusicDTO> addIndexToBandMusicDTO(List<BandMusicDTO> playList){
		for(int i = 0; i < playList.size(); i++) 
			playList.get(i).setIndex(String.valueOf(i));
		return playList;
	}////addIndexToBandMusicDTO
	
	
}//class
