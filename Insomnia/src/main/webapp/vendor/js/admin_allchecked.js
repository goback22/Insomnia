$(function(){
	//checked about checkbox 
	let memberLength = $(':checkbox[name=allmember]').length;
	$(':checkbox:first').click(function(){
		if($(this).is(':checked')){			
			$(':checkbox[name=allmember]').prop('checked',true);
			
		}
		else{
			$(':checkbox[name=allmember]').prop('checked',false);
		}
	});
	$(':checkbox[name=allmember]').click(function(i){
		if($(':checkbox[name=allmember]:checked').length == memberLength ){
			$(':checkbox:first').prop('checked',true);
		}
		else{
			$(':checkbox:first').prop('checked',false);
		}
	});
	
	//테이블 우측 하단 수락 삭제버튼
	$('.deny').click(function(){
		console.log("거부버튼");
		//$(this).closest('tr').css("display","none");
		$(this).removeClass().addClass("btn btn-danger").html("거부됨");
		$(this).prev().remove();
	});
	$('.apply').click(function(){
		console.log("수락버튼");
		//$(this).closest('tr').css("display","none");
		$(this).removeClass().addClass("btn btn-success").html("수락됨");
		$(this).next().remove();
	});
	//삭제버튼
	//1 체크박스 선택시
	$(':checkbox[name=allmember]').click(function(){
		if($(this).is(':checked')){
			$(this).addClass('readytodelete');
			$(this).closest('.fold').addClass('readytodelete');
			console.log("checked");
		}
		else{
			$(this).removeClass('readytodelete');
			$(this).closest('.fold').removeClass('readytodelete');
			console.log("unchecked");
		}
		
	});
	//2 밑에 삭제버튼 클릭시
//	$('table').next('div').click(function(){
	$('.checkeddelete').click(function(){	
		console.log("전체삭제");
		if($(':checkbox:first').is(':checked')){
			$(':checkbox[name=allmember]').each(function(){
			var tr_value = $(this).val();
            var tr=$("tr[data-tr_value='"+tr_value+"']");
            tr.remove();
			});
			$(':checkbox:first').prop('checked',false);
			
		}
		else{
			$('.readytodelete').closest('tr').remove();
			
		}
	});
	
	
	
});