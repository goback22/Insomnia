package com.kosmo.insomnia.web.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@RequestMapping(value="/Pay/PayPage.ins")
	public String payPage() {
		return "/Pay/PayPage.tiles";
	}///
	
}/////class
