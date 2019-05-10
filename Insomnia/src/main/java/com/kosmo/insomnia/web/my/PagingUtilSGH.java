package com.kosmo.insomnia.web.my;

public class PagingUtilSGH {  // 교안과 로직 똑같은데, out.println()만 String변수에 누적해서 씀

	public static String pagingText(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){  //마지막 매개변수 페이지명
		String pagingStr="";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
                
			//pagingStr+="<a href='"+page+"nowPage=1'>◀◀</a>&nbsp;<a href='"+page+"nowPage="+(intTemp -1)+"'>◀</a>";
																							//이전 처음 이동은 -blockpage
			
			//pagingStr+="<a href='<c:url value=\""+page+"nowPage=1'>◀◀</a>&nbsp;<a href='"+page+"nowPage="+(intTemp -1)+"'>◀</a>";
			pagingStr += "<a href='<c:url value='"+page+"nowPage=1'/>'>◀◀</a>&nbsp;<a href='<c:url value=\""+page+"nowPage="+(intTemp - 1)+"\">'>◀</a>";

		}
		
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<span style='Color:red'>"+intTemp+"</span>&nbsp;";  //현재 페이지는 클릭되지 않게 스트링으로
			}
		     else
		    	 //pagingStr+="<a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a>&nbsp;";
		    	 pagingStr += "<a href='<c:url value='"+page+"nowPage="+intTemp+"'/>'>"+intTemp+"</a>&nbsp;";

		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){

			//pagingStr+="<a href='"+page+"nowPage="+intTemp+"'>▶</a>&nbsp;<a href='"+page+"nowPage="+totalPage+"'>▶▶</a>"; 
			pagingStr += "<a href='<c:url value=\""+page+"nowPage="+intTemp+"\"/>'>▶</a>&nbsp;<a href='<c:url value=\""+page+"nowPage="+totalPage+"\">'>▶▶</a>";

				   
		}
		
		return pagingStr;
	}
	public static String pagingBootStrapStyle(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		
		String pagingStr="<nav><ul class=\"pagination\" >";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			//      "List.jsp?" 를 page변수 대신해서 
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage=1'>\r\n" + 
					"<span \">&laquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='"+page+"nowPage="+(intTemp -blockPage)+"' >\r\n" + 
					"<span \">&lsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				//pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
				pagingStr+="<li><a href='"+page+"'><span style='Color:red'>"+intTemp+"</span></a></li>";

			}
		     else
		    	 pagingStr+="<li><a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage="+intTemp+"'>\r\n" + 
					"<span aria-hidden=\"true\">&rsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='"+page+"nowPage="+totalPage+"' >\r\n" + 
					"<span aria-hidden=\"true\">&raquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
	
}
