package com.kosmo.insomnia.web.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Free_BoardController {
	
	@RequestMapping("/Free_Board.ins")
	public String freeBoard() throws Exception{
		return "/Pay/Free_Board.tiles";
	}/////freeBoard()
	
}/////class
