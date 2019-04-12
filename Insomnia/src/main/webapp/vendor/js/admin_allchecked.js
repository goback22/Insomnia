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
});