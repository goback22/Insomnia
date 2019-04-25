package com.kosmo.insomnia.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MusicController {
	@ResponseBody
	@RequestMapping(value="/music/loadMusicToHeaderPlayer.ins", produces="text/html; charset=UTF-8")
	public String loadMusicToHeaderPlayer(@RequestParam Map map, Model model) {
		List<Map<String, String>> musicList = new Vector<Map<String,String>>();
		Map<String, String> music = new HashMap<String, String>();
		
		music.put("title", "insomnia forever");
		music.put("artist", "insomnia");
		music.put("mp3", "../upload/band/music/insomnia.mp3");
		music.put("poster", "../upload/band/cover/teamlogo.png");
		
		musicList.add(music);
		System.out.println(musicList.toString());
		System.out.println("music/loadMusicToHeaderPlayer");
        return JSONArray.toJSONString(musicList);
	}////
}//class
