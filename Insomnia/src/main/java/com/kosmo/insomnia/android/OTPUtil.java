package com.kosmo.insomnia.android;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base32;

public class OTPUtil{
	
	private static final long DISTANCE = 30000; // 30 sec
	private static final String ALGORITHM = "HmacSHA1";
	private static final byte[] SECRET_KEY = "define your secret key here".getBytes();
	
	private static long create(long time) throws Exception {
		byte[] data = new byte[8];
		
		long value = time;
		for (int i = 8; i-- > 0; value >>>= 8) {
			data[i] = (byte) value;
		}
	 
		Mac mac = Mac.getInstance(ALGORITHM);
		mac.init(new SecretKeySpec(SECRET_KEY, ALGORITHM));
	 
		byte[] hash = mac.doFinal(data);
		int offset = hash[20 - 1] & 0xF;
	 
		long truncatedHash = 0;
		for (int i = 0; i < 4; ++i) {
			truncatedHash <<= 8;
			truncatedHash |= hash[offset + i] & 0xFF;
		}
	 
		truncatedHash &= 0x7FFFFFFF;
		truncatedHash %= 1000000;
	 
		return truncatedHash;
	}
	
	public static String create() throws Exception {
		return String.format("%06d", create(new Date().getTime() / DISTANCE));
	}

	public static boolean vertify(String code) throws Exception {
		return create().equals(code);
	}
	
}/////class
