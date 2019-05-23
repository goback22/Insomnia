package com.kosmo.insomnia.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WebRTCController {

	@RequestMapping("/webRTC/getUserMedia.ins")
	public String getUserMedia(@RequestParam Map params) {
		return "/webRTC/getUserMedia";
	}///getUsermedia
	
}////controller
