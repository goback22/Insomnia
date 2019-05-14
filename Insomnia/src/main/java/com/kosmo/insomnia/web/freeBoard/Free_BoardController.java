package com.kosmo.insomnia.web.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.insomnia.service.FreeBoardService;
import com.kosmo.insomnia.service.GoodNbadService;

@Controller
public class Free_BoardController {
	
	@Resource(name="freeService")
	private FreeBoardService freeService;
	
	@Resource(name="goodService")
	private GoodNbadService goodService;
	
	@RequestMapping("/freeBoard/Free_Board.ins")
	public String freeBoard(Map map) throws Exception{
		map.put("list", freeService.selectList(null));
		return "/freeBoard/Free_Board.tiles";
	}/////freeBoard()
	
	@RequestMapping("/freeBoard/Free_Board_View.ins")
	public String freeBoard_View(HttpSession session, @RequestParam Map map1, Map map2) throws Exception{
		
			String id = session.getAttribute("id").toString();
			String title = map1.get("free_title").toString();
			String content = map1.get("free_content").toString();
			
			Map list = new HashMap();
			
			list.put("id", id);
			list.put("title", title);
			list.put("content", content);
			
			freeService.insert(list);		
		return "forward:/freeBoard/Free_Board.ins";
	}/////freeBoard()
	
	@RequestMapping("/freeBoard/Free_Board_Write.ins")
	public String freeBoardWrite(@RequestParam Map map) throws Exception{
		
		return "/freeBoard/Free_Board_write.tiles";
	}/////freeBoard()
	
	@RequestMapping("/freeBoard/Free_Board_One.ins")
	public String freeBoardOne(HttpSession session, @RequestParam Map map1, Map map2) throws Exception{
		Map no = new HashMap();
		no.put("no", map1.get("no"));
		
		map2.put("no", map1.get("no"));
		map2.put("id", session.getAttribute("id"));
		
		map2.put("list", freeService.selectOne(no));
		
		freeService.update_views(no);
		return "/freeBoard/Free_Board_One.tiles";
	}/////freeBoard()
	
	@RequestMapping("/freeBoard/Free_Board_Modified.ins")
	public String freeBoardModified(HttpSession session, @RequestParam Map map1, Map map2) throws Exception{
		Map no = new HashMap();
		System.out.println("title : " + map1.get("free_title"));
		System.out.println("title : " + map1.get("free_title"));
		System.out.println("content : "+ map1.get("free_content"));
		no.put("no", map1.get("no"));
		no.put("title", map1.get("free_title"));
		no.put("content", map1.get("free_content"));
		
		freeService.update(no);
		
		return "forward:/freeBoard/Free_Board.ins";
	}/////freeBoard()
	
	@RequestMapping("/freeBoard/Free_Board_Delete.ins")
	public String freeBoardDelete(HttpSession session, @RequestParam Map map1, Map map2) throws Exception{
		System.out.println("no의 값 : "+map1.get("no").toString());
		Map no = new HashMap();
		no.put("no", map1.get("no"));
		goodService.delete(no);
		freeService.delete(no);
		
		return "forward:/freeBoard/Free_Board.ins";
	}/////freeBoard()
	
	@ResponseBody
	@RequestMapping("/freeBoard/Free_Board_like.ins")
	public String freeBoardLike(HttpSession session, @RequestParam Map map) throws Exception{
		Map no = new HashMap();
		no.put("no", map.get("no"));
		no.put("id",session.getAttribute("id"));
		
		Map list = new HashMap();
		
		List<Map> collection = new Vector<Map>();
		
		if(goodService.selectOne(no) == null) {
			goodService.insert(no);
			freeService.update_like(no);
			list.put("like", freeService.selectOne(no).getIlikeyou());
			list.put("yesorno", "Y");
			collection.add(list);
			System.out.println("추천 가능 : "+collection);
			return JSONArray.toJSONString(collection);
		}
		list.put("yesorno", "N");
		collection.add(list);
		System.out.println("추천 불가능 : "+collection);
		
		return JSONArray.toJSONString(collection);
	}/////freeBoard()
	
	@ResponseBody
	@RequestMapping("/freeBoard/Free_Board_hate.ins")
	public String freeBoardHate(HttpSession session, @RequestParam Map map) throws Exception{
		Map no = new HashMap();
		no.put("no", map.get("no"));
		no.put("id",session.getAttribute("id"));
		
		Map list = new HashMap();
		
		List<Map> collection = new Vector<Map>();
		
		
		if(goodService.selectOne(no) == null) {
			goodService.insert(no);
			freeService.update_hate(no);
			list.put("hate", freeService.selectOne(no).getIhateyou());
			list.put("yesorno", "Y");
			collection.add(list);
			System.out.println("추천 가능 : "+collection);
			return JSONArray.toJSONString(collection);
		}
		list.put("yesorno", "N");
		collection.add(list);
		System.out.println("추천 불가능 : "+collection);
		
		return JSONArray.toJSONString(collection);
	}/////freeBoard()
	
	
	
	
	
}/////class
