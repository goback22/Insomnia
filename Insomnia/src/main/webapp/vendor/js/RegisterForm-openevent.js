/** �ㅽ뵂 �대깽�� 愿��� **/
(function ($) {
    $.openevent = {
    	nowStampType : "" 
    	,
    	getStamp : function(typeCode)
    	{
    		if ( $(".btn_sb_emblem").size()  > 0 )
    		{
    			$(".btn_sb_emblem").remove();
    		}
    		
    		/**
    		console.log( $("link[title='promotionOpenEvent']").attr("href") );
    		console.log( $(".btn_sb_emblem").size() );
    		

    		//$(".btn_sb_emblem").remove();
    		
    		if ( $("link[title='promotionOpenEvent']").attr("href") == undefined )
    		{
    			$("head").append('<link href="/common/css/style_whatsnew_prom.css" rel="stylesheet" title="promotionOpenEvent" />  ');
    		}
    		
    		
    		
    		if ( typeCode == "" || typeCode == undefined)
    		{
    			alert("�섎せ�� �몄텧�낅땲��.");
    			return;
    		}
    		
    		this.nowStampType = typeCode;
			__ajaxCall("/openevent/stamp.do",{}, true, "json", "post",
					function (data) 
					{
						if ( data.error_code == "0" )
						{
							console.log(data);
							var ww = $(window).width();
							var wh = $(window).height();
							
							var stamp_left = (ww * ( data.left / 100));
							var stamp_top  = (wh * ( data.top  / 100));
							
							var stamp = '<div class="btn_sb_emblem" style="left:'+stamp_left+'px;top:'+stamp_top+'px"><a href="javascript:void(0);"></a></div>';
							
							$("#container").prepend(stamp);
							
							$(window).on("resize", function(){
								var ww = $(window).width();
								var wh = $(window).height();
								
								var stamp_left = (ww * ( data.left / 100));
								var stamp_top  = (wh * ( data.top  / 100));
								
								$("#container").find("div.btn_sb_emblem").css({
									"left" : stamp_left + "px",
									"top" : stamp_top + "px"
								});
								
							});
							
							$(".btn_sb_emblem").find("a").unbind("click").on("click", function(){
								
								$(this).parent().effect('shake').animate({
									'top':'-100px',
									'left':'200px',
									'opacity':'0'
								}, 200);
								
								
								setTimeout(function(){
									var isType = $.openevent.nowStampType;
									console.log(isType);									
									__ajaxCall("/openevent/stampInsert.do",{ "stamp_type" : isType}, true, "json", "post",
											function (data) 
											{
												if (data.error_code == "0" || data.error_code == "-8")
												{
													if ( data.error_code == "-8" )
													{
														alert(data.error_msg);
													}
													
													
													var openHtml = "";
													
														openHtml += ' <div class="pop_renew_congu openEventWrap" style="display:none"> ';
														openHtml += ' 	<header class="pop_renew_congu_ttl"> ';
														openHtml += ' 		<h4>異뺥븯�⑸땲��!</h4> ';
														openHtml += ' 		<p class="pop_renew_congu_close"> ';
														openHtml += ' 			<a href="javascript:void(0):" class="openEventClose">�リ린</a> ';
														openHtml += ' 		</p> ';
														openHtml += ' 	</header> ';
														openHtml += ' 	<section class="pop_renew_congu_cont"> ';
														openHtml += ' 		<p class="regist_stat_txt">16二쇰뀈 �좊툝�쇱쓣 <strong class="oe_stamp_count"></strong> 李얠쑝�⑥뒿�덈떎.</p> ';
														openHtml += ' 			<div class="pop_renew_stamp_wrap"> ';
														openHtml += ' 				<ul class="openEventList"> ';
														openHtml += ' 				</ul> ';
														openHtml += ' 			</div> ';
														openHtml += ' 		<div class="btn_renew_regi_guide"> ';
														openHtml += ' 			<a href="/whats_new/campaign_view.do?pro_seq=1048"><img alt="" src="/common/img/whatsnew/rn_open/btn_renew_regi_guide.png"></a> ';
														openHtml += ' 		</div> ';
														openHtml += ' 		<p class="congu_stat_warn">* 16媛쒖쓽 �좊툝�쇱쓣 紐⑤몢 李얠쑝�� 寃쎌슦 �뱀꺼 �뺣쪧�� �믪븘吏묐땲��.</p> ';
														openHtml += ' 	</section> ';
														openHtml += ' </div> ';			
														
														$(".openEventWrap").remove();
														$("#container").prepend(openHtml);
														
														$(".openEventClose").on("click", function(){
															$(".openEventWrap").hide();
														});
														
														__ajaxCall("/openevent/getStamp.do",{}, true, "json", "post",
																function (data) 
																{
																	console.log(data);
																	
																	if ( data.error_code == "0")
																	{
																		if (data.recordcount > 0)
																		{
																			$(".btn_sb_emblem").hide();
																			$(".openEventWrap").fadeIn("fast", function(){
																				
																				if ( parseInt( data.recordcount ) >= 16)
																				{
																					$(".oe_stamp_count").html( "16媛�");
																				}
																				else
																				{
																					$(".oe_stamp_count").html( data.recordcount + "媛�");
																				}
																				
																				var cHtml = "";
																				$(".openEventList").html("");
																				$.each( data.list, function(x,y){
																					console.log(y);
																					
																					if ( x <= 15)
																					{
																						cHtml = "";
																						cHtml = '<li class="pop_renew_stamp"><img alt="" src="/common/img/whatsnew/rn_open/stamp_on.png" style="display:none" class="stampImage"></li>';
																						$(".openEventList").append(cHtml);
																						$(".stampImage").fadeIn(1000, 'easeInOutBounce');
																					}
																					
																				});
																				//$(".openEventList").html(cHtml);
																				
																				
																				if ( data.recordcount <= 5 )
																				{
																					cHtml = "";
																					for ( var i = 0; i < 5-(data.recordcount); i++)
																					{
																						cHtml = "";
																						cHtml += '<li class="pop_renew_stamp"></li>';
																						$(".openEventList").append(cHtml);
																					}
																				}
																				//console.log(isLeft);
																				
																			})
																		}
																		
																	}
																	else
																	{
																		alert(data.error_msg);
																		return;
																	}
															    }
																, 
																function(_error)
																{
																}
													    	);    													
														
														
														
														
														
														
														
													
													
												}
												else
												{
													if (data.error_code == "-9")
													{
														if ( confirm(data.error_msg) )
														{
															$.loginLib.showLayerLogin();
														}
													}
													else
													{
														alert(data.error_msg);
														return;
													}
													

												}
												
										    }
											, 
											function(_error)
											{
											}
								    	); 									
								},800);
								
								


   								
								
								
							});
							
						}
			        }
					, 
					function(_error)
					{
					}
	    	);    		
    		
    		
    		**/
    		
    		
    		
    	}
    };
})(jQuery);

$(document).ready(function(){
	
	$('.ev_seq1129_link2').bind('click', function(){
		alert('�섏씠�ㅻ턿�먯꽌 360�� �숈쁺�곸쓣 �먰솢�섍쾶 �쒖껌�섍린 �꾪븯�� �꾨옒 �ы빆�� 瑗� �뺤씤�댁＜�몄슂.\n - 紐⑤컮�� �묒냽 �� : �섏씠�ㅻ턿 �깆쑝濡� �쒖껌�섏떆湲� 諛붾엻�덈떎. (理쒖떊踰꾩쟾 �낅뜲�댄듃 �꾩닔)\n - PC �묒냽 �� : �щ＼(Chrome)�� �듯빐 �쒖껌�섏떆湲� 諛붾엻�덈떎. (湲고� 釉뚮씪�곗졇 �댁슜 ��, �먰솢�� �곸긽 媛먯긽�� �대젮�� �� �덉쓬) ');
	});

	$(window).on("load", function(){
			
		
		var openCnt = 0;
		var openJsUrl = "";
		
		
		
		/** 4二쇰뀈 �대깽�� �댁껌�� 諛쒗몴 濡쒖쭅 **/
		$(".ev_seq1066_link").on("click", function(){
			
			var wt = $(window).scrollTop();
			$('.msr4_result_pop').css({'top' : wt + 50});
			
			$(".msr4_result_pop").fadeIn("fast", function(){
				$(".msr4_close_btn").on("click", function(){
					
					$(".msr4yesWinWrap").hide();
					$(".msr4noWinWrap").hide();				
					$("#label_q").val("");					
					$(".msr4_result_pop").hide();
				});
				$(".msr4yesWinWrap").hide();
				$(".msr4noWinWrap").hide();				
				$("#label_q").val("");
				
				
				$(".msr4_id_search").unbind("click").on("click", function(){
					var winner = $("#label_q").val();
					if( winner == "") 
					{
						alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
						$("#label_q").focus();
						return;
					}	
					
					__ajaxCall("/common/js/openevent/msr4_user.js",{}, true, "json", "post",
							function (data) {
								
								var msr4_winUser = winner.toUpperCase();
								var msr4_winRank = "";
								var msr4_winCnt  = 0;
								
								$.each( data.people, function(x,y){
									if ( msr4_winUser  == y.USER) {
										msr4_winRank = y.RANK;
										msr4_winCnt++;
									}
								});
								
								if ( msr4_winCnt > 0 )	//�뱀꺼�ъ쓣��
								{
									$(".msr4noWinWrap").hide();
									$(".msr4yesWinWrap").show();
									
									$(".msr4_rank").hide();
									if( msr4_winRank == "1")
									{
										$(".msr4_rank_1").show();
									}
									
									if( msr4_winRank == "2")
									{
										$(".msr4_rank_2").show();
									}
									
									if( msr4_winRank == "3")
									{
										$(".msr4_rank_3").show();
									}									
																		
								}
								else //�뱀꺼�섏� �딆븯�꾨븣
								{
									$(".msr4yesWinWrap").hide();
									$(".msr4noWinWrap").show();
									$(".msr4UserInfo").html( msr4_winUser + "��");
								}
								

					        } , 
							function(_error) {
							}
					);					
					
					
				});
				
			});
		});
		/** 4二쇰뀈 �대깽�� �댁껌�� 諛쒗몴 濡쒖쭅 **/
		
		/** event_1058 */
		
		$(".ev_seq1058_link5").bind("click",function(){
			
			var wt = $(window).scrollTop();
			$('.msr4_result_pop').css({'top' : wt + 50});
			
			$(".msr4_result_pop").fadeIn("fast", function(){
				$(".msr4_close_btn").on("click", function(){
					
					$(".msr4yesWinWrap").hide();
					$(".msr4noWinWrap").hide();				
					$("#label_q").val("");					
					$(".msr4_result_pop").hide();
					$('.pop_dimm').hide();
				});
				$(".msr4yesWinWrap").hide();
				$(".msr4noWinWrap").hide();				
				$("#label_q").val("");
				$('.pop_dimm').show();
				
				
				$(".msr4_id_search").unbind("click").on("click", function(){
					var winner = $("#label_q").val();
					if( winner == "") 
					{
						alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
						$("#label_q").focus();
						return;
					}	
					
					__ajaxCall("/common/js/openevent/openevent_1058.js",{}, true, "json", "post",
							function (data) {
						
								var msr4_winUser = winner.toUpperCase();
								var msr4_winRank = "";
								var msr4_winCnt  = 0;
								var testuser = "";
								
								$.each( data.people, function(x, y){
																		
									if ( msr4_winUser  == y.USER) {
										msr4_winCnt++;
										testuser = y.USER;
									}
								});
																
								if ( msr4_winCnt > 0 )	//�뱀꺼�ъ쓣��
								{
									$(".msr4noWinWrap").hide();
									$(".msr4yesWinWrap").show();
									
									$(".msr4_rank").hide();

									$(".msr4_rank_1").show();
									$(".msr4UserInfo2").html( msr4_winUser + " ��");	
								}
								else //�뱀꺼�섏� �딆븯�꾨븣
								{
									$(".msr4yesWinWrap").hide();
									$(".msr4noWinWrap").show();
									$(".msr4UserInfo2").html( msr4_winUser + " ��");	
								}
								

					        } , 
							function(_error) {
							}
					);					
					
					
				});
				
			});
			
		});
		
		
		
		
		$(".openEventPopCall").on("click", function(){
			openCnt = $(".openEventPopCall").index($(this));
			
			if(openCnt == 0) {
				openJsUrl = "/common/js/openevent/openevent_join_user.js";
				$('.evenprizewinner > h4').text("Event 1 - �뱀꺼 �щ� �뺤씤 �섍린");
			} else if(openCnt == 1) {
				openJsUrl = "/common/js/openevent/openevent_16th_user.js";
				$('.evenprizewinner > h4').text("Event 2 - �뱀꺼 �щ� �뺤씤 �섍린");
			} else if(openCnt == 2) {
				openJsUrl = "/common/js/openevent/openevent_mod_user.js";
				$('.evenprizewinner > h4').text("Event 3 - �뱀꺼 �щ� �뺤씤 �섍린");
			}
			
			$("#openEvnetWinnerTxt").val('');
			$(".winnerResult").hide();
			$(".failResult").hide();
			$(".pop_dimm").show();
			$(".pop_dimm").off('click');
			$(".openEventWinnerPopCall").fadeIn("fast", function(){
			});
			
			
			$(".openEventPopCloseBtn").on("click", function(){
				$(".openEventWinnerPopCall").fadeOut("fast");
				$(".pop_dimm").hide();
			});		
			
			$(".winnerSearchBtn").on("click", function(){
				var winner = $("#openEvnetWinnerTxt").val();
				
				if( winner == "") 
				{
					alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
					$("#openEvnetWinnerTxt").focus();
					return;
				}
				
				__ajaxCall(openJsUrl,{}, true, "json", "post",
				function (data) {
					
					var winUser = winner.toUpperCase();
					var winCnt  = 0;
					
					$.each( data.people, function(x,y){
						if ( winUser == y.id) {
							winCnt++;
						}
					});
					
					$(".targetUserTxt").html( winUser + "��");
					if(openCnt == 0) {
						$('.tallDrink').html('�ㅻ뒛�� 而ㅽ뵾 臾대즺 �뚮즺(Tall size)<br />e-荑좏룿�� �쒕┰�덈떎.');
					} else {
						$('.tallDrink').html('臾대즺 �뚮즺 Tall size e-荑좏룿��<br />�쒕┰�덈떎.');
					}
					if ( winCnt > 0 ) {
						$(".winnerResult").show();
						$(".failResult").hide();
					} else {
						$(".winnerResult").hide();
						$(".failResult").show();								
					}
		        } , 
				function(_error) {
				});
			});
		});
		
		
});
	$(".ev_seq1102_link2").on("click", function () {
		if (new Date() < new Date(2015, 12 - 1, 15, 0, 0, 0)) {
			alert("�대깽�� �묐え�� 12��15�� 遺��� 媛��ν빀�덈떎.");
			return;
		}
		
		location.href = "https://www.istarbucks.co.kr/mem/join.do";
	});
	
	$(".ev_seq1102_link3").on("click", function () {
		if (new Date() < new Date(2015, 12 - 1, 15, 0, 0, 0)) {
			alert("�대깽�� �묐え�� 12��15�� 遺��� 媛��ν빀�덈떎.");
			return;
		}
		
		location.href = "https://www.istarbucks.co.kr/my/myinfo_modify_login.do";
	});
	
	// �섏씠�ㅻ턿 怨듭쑀 20151214
	$(".ev_seq1102_link4").on("click", function(){
		if (new Date() < new Date(2015, 12 - 1, 15, 0, 0, 0)) {
			alert("�대깽�� �묐え�� 12��15�� 遺��� 媛��ν빀�덈떎.");
			return;
		}
		
		__ajaxCall("/whats_new/stempLoginCheck.do", {}, true, "json", "post",
			function (data) {
				if(data.result_code == "SUCESS"){
					var msg = "�대깽�� 李몄뿬瑜� �꾪빐 �섏씠�ㅻ턿 怨꾩젙�쇰줈 濡쒓렇�명빀�덈떎.";
					if (navigator.userAgent.toLocaleLowerCase().indexOf("android") > -1) {
						msg += "\n\n*�덈뱶濡쒖씠�� 湲곕컲�� 紐⑤컮�� 湲곌린�먯꽌 �대깽�� 李몄뿬 �� chrome�� �ъ슜�섏떆硫� 蹂대떎 �덉젙�곸쑝濡� 怨듭쑀�섏뿬 �대깽�몄뿉 李몄뿬�섏떎 �� �덉뒿�덈떎.";
					}
					
					if(confirm(msg)){
						var $param = {
							method: 'feed',
							/*name: '�ㅽ�踰낆뒪 �뱀궗�댄듃 & �좏뵆由ъ��댁뀡  3愿��� �섏긽 湲곕뀗 �대깽��',*/
							link: 'http://www.istarbucks.co.kr/whats_new/campaign_view.do?pro_seq=1102' ,
							image: 'http://sns.mdplus.kr/images/event/award.jpg'			,
							caption: '�ㅽ�踰낆뒪 �뱀궗�댄듃 & �좏뵆由ъ��댁뀡  3愿��� �섏긽 湲곕뀗 �대깽��',
							description: '�깆뼱�뚮뱶 肄붾━�� & �ㅻ쭏�몄빋 �댁썙�� 3媛쒕�臾� �섏긽 湲곕뀗 �ㅼ뼇�섍쾶 以�鍮꾨맂 �대깽�몄뿉 李몄뿬�대낫�쒓퀬 �띿꽦�섍쾶 以�鍮꾨맂 �뚮즺 荑좏룿�� 二쇱씤怨듭씠 �섏꽭��!'
						};
						
						facebookFeed( $param, function(){
							alert("�섏씠�ㅻ턿 怨듭쑀媛� �꾨즺 �섏뿀�듬땲��.");
							setUserInfo();
							return;
						}, function(){
							alert("怨듭쑀媛� 痍⑥냼 �섏뿀�듬땲��.");
							return;									
						});
					} else{
						return;
					}
				}else{
					if(confirm("濡쒓렇�� �� �댁슜 媛��� �⑸땲��. 濡쒓렇�� �섏떆寃좎뒿�덇퉴?")){
						location.href="/login/login.do?redirect_url=/whats_new/campaign_view.do?pro_seq=1102";
					}else{
						return;
					}
				}
			},
			function(data) {
			}
		);
	});
	
	
	// 怨좉컼�뺣낫 �깅줉
	function setUserInfo()
	{
		var param = {};
		__ajaxCall("/openevent/setStbOpenEvent.do", param, true, "json", "post",
				function (_response) 
				{
					if ( _response.error_code != "0"){
						alert(_response.error_msg);
					}
		        }
				, 
				function(_error)
				{
					console.log('�ㅽ뙣');
				}
		);
	}
			
	//SEQ=1102 �앹뾽 異붽�
	$('.ev_seq1102_img01 a.ev_seq1102_link1').bind('click', function(){
		$('.layer_dimm_seq1102, .layer_popup_seq1102').fadeIn();
	});
	$('.layer_popup_seq1102_close, .layer_dimm_seq1102').bind('click', function(){
		$('.layer_dimm_seq1102, .layer_popup_seq1102').fadeOut();
	});
	//SEQ=1102 �앹뾽 end

	
	/* 151222 源�誘쇳샇 異붽� */
	$('.ev_seq1085_last_img01 a').bind('click', function(){
		$('.smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	/* 151222 源�誘쇳샇 異붽� end */

	$('.ev_seq1102_last_img01 a.ev_seq1102_last_link1').bind('click', function(){
		$(".btn_smt_ztext").html("");
		$("#label_q").val('');
		$("#label_q2").val('');
		$(".btn_smt_zimg").hide();
		$(".btn_smt_pimg").hide();
		$('.smt_evenprizewinner_popUp').fadeIn();
			$('.pop_dimm').show();
	});

	//SEQ=1112 �앹뾽 異붽�
	$('.ev_seq1112_img01 a.ev_seq1112_link1').bind('click', function(){
		$('.layer_dimm_seq1112, .layer_popup_seq1112').fadeIn();
	});
	$('.layer_popup_seq1112_close, .layer_dimm_seq1112').bind('click', function(){
		$('.layer_dimm_seq1112, .layer_popup_seq1112').fadeOut();
	});
	//SEQ=1112 �앹뾽 end
	//�섏긽湲곕뀗 異뺥븯 硫붿떆吏� �섏씠�ㅻ턿 怨듭쑀 �앹뾽
	$('.ev_seq1102_last_img01 a.ev_seq1102_last_link2').bind('click', function(){
		$(".btn_smt_ztext").html("");
		$("#label_q").val('');
		$("#label_q2").val('');
		$(".btn_smt_zimg").hide();
		$(".btn_smt_pimg").hide();
		$('.smt_evenprizewinner_popUp2').fadeIn();
		$('.pop_dimm').show();
	});
	$('.smt_evenprizewinner_popUp2 p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.smt_evenprizewinner_popUp2, .pop_dimm').fadeOut();
	});
	//��,�ㅻ쭏�몄빋  �댁썙�� 肄붾━�꾨�? �앹뾽
	$('.ev_seq1102_last_img02 a.ev_seq1102_last_link3').bind('click', function(){
		$('.layer_dimm_seq1102_last, .layer_popup_seq1102_last').fadeIn();
	});
	$('.layer_popup_seq1102_last_close, .layer_dimm_seq1102_last').bind('click', function(){
		$('.layer_dimm_seq1102_last, .layer_popup_seq1102_last').fadeOut();
	});
	
	//SEQ=1102 �앹뾽 異붽�
	//�좉퇋 媛��� �먮뒗 怨꾩젙 �뺣낫 �낅뜲�댄듃 �앹뾽 
						 
	$('.ev_seq1120_last_img01 a.ev_seq1120_last_link1').bind('click', function(){
		$('.smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	
	//SEQ=1102 �앹뾽 end
	
	//SEQ=1149 �앹뾽 異붽�
	$('.ev_seq1149_img01 a.ev_seq1149_link1').bind('click', function(){
		$('.1149_smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.1149_smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.1149_smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	//SEQ=1149 �앹뾽 end

	//SEQ=1168 �앹뾽 異붽�
	$('.ev_seq1168_img01 a.ev_seq1168_link1').bind('click', function(){
		$('.1168_smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.1168_smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.1168_smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	//SEQ=1168 �앹뾽 end
	
	//SEQ=1168 �뱀꺼��
	$(".1168_btn_eq").on("click", function() {
		try {
			var winner = $("#1168_label_q").val();
			if( winner == "") 
			{
				alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
				$("#1168_label_q").focus();
				return;
			}	
		
			$.getJSON( "/common/js/openevent/pro1168_0525.js", function( data ) {
				var msr4_winUser = winner.toUpperCase();
				var msr4_winRank = "";
				var msr4_winCnt  = 0;
				
				$.each( data.people, function(x,y){
					if ( msr4_winUser  == y.USER) {
						msr4_winRank = y.RANK;
						msr4_winCnt++;
					}
				});
				
				if ( msr4_winCnt == 0 )	//�뱀꺼�ъ쓣��
				{
					$(".1168_zimg").hide();
					$(".1168_pimg").show();
					$(".1168_ztext").html( msr4_winUser + "��");
				}
				else //�뱀꺼�섏� �딆븯�꾨븣
				{
					$(".1168_zimg").show();
					$(".1168_pimg").hide();
					$(".1168_ztext").html( msr4_winUser + "��");
				}
			});					
		} catch(_e) {
			alert("�뱀꺼�� 議고쉶 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
		}
	});

	//SEQ=1180 �앹뾽 異붽�
	$('.ev_seq1180_img01 a.ev_seq1180_link1').bind('click', function(){
		$('.1180_smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.1180_smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.1180_smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	//SEQ=1180 �앹뾽 end
	//SEQ=1180 �뱀꺼��
	$(".1180_btn_eq").on("click", function() {
		try {
			var winner = $("#1180_label_q").val();
			if( winner == "") 
			{
				alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
				$("#1180_label_q").focus();
				return;
			}	
		
			$.getJSON( "/common/js/openevent/pro1180_0629.js", function( data ) {
				var msr4_winUser = winner.toUpperCase();
				var msr4_winRank = "";
				var msr4_winCnt  = 0;
				
				$.each( data.people, function(x,y){
					if ( msr4_winUser  == y.USER) {
						msr4_winRank = y.RANK;
						msr4_winCnt++;
					}
				});
				
				if ( msr4_winCnt == 0 )	//�뱀꺼�ъ쓣��
				{
					$(".1180_zimg").hide();
					$(".1180_pimg").show();
					$(".1180_ztext").html( msr4_winUser + "��");
				}
				else //�뱀꺼�섏� �딆븯�꾨븣
				{
					$(".1180_zimg").show();
					$(".1180_pimg").hide();
					$(".1180_ztext").html( msr4_winUser + "��");
				}
			});					
		} catch(_e) {
			alert("�뱀꺼�� 議고쉶 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
		}
	});
	
	//SEQ=1183 �앹뾽 異붽�
	$('.ev_seq1183_img01 a.ev_seq1183_link1').bind('click', function(){
		$('.smt_evenprizewinner_popUp').fadeIn();
		$('.pop_dimm').show();
	});
	$('.1183_smt_evenprizewinner_popUp p.close a, p.btn_pz_close a, .pop_dimm').bind('click', function(){
		$('.1183_smt_evenprizewinner_popUp, .pop_dimm').fadeOut();
	});
	//SEQ=1183 �앹뾽 end
	//SEQ=1183 �뱀꺼��
	$(".1183_btn_eq").on("click", function() {
		try {
			var winner = $("#1183_label_q").val();
			if( winner == "") 
			{
				alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
				$("#1183_label_q").focus();
				return;
			}	
		
			$.getJSON( "/common/js/openevent/pro1183_0630.js", function( data ) {
				var msr4_winUser = winner.toUpperCase();
				var msr4_winRank = "";
				var msr4_winCnt  = 0;
				
				$.each( data.people, function(x,y){
					if ( msr4_winUser  == y.USER) {
						msr4_winRank = y.RANK;
						msr4_winCnt++;
					}
				});
				
				if ( msr4_winCnt == 0 )	//�뱀꺼�ъ쓣��
				{
					$(".1183_zimg").hide();
					$(".1183_pimg").show();
					$(".1183_ztext").html( msr4_winUser + "��");
				}
				else //�뱀꺼�섏� �딆븯�꾨븣
				{
					$(".1183_zimg").show();
					$(".1183_pimg").hide();
					$(".1183_ztext").html( msr4_winUser + "��");
				}
			});					
		} catch(_e) {
			alert("�뱀꺼�� 議고쉶 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
		}
	});
	
	
	$(".label_q_1120").unbind("click").on("click", function(){
		var winner = $("#label_q_1120").val();
		if( winner == "") 
		{
			alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
			$("#label_q_1120").focus();
			return;
		}	
		
		__ajaxCall("/common/js/openevent/cvStatistics_0307.js",{}, true, "json", "post",
				function (data) {
					var msr4_winUser = winner.toUpperCase();
					var msr4_winRank = "";
					var msr4_winCnt  = 0;
					
					$.each( data.people, function(x,y){
						if ( msr4_winUser  == y.USER) {
							msr4_winRank = y.RANK;
							msr4_winCnt++;
						}
					});
					
					if ( msr4_winCnt == 0 )	//�뱀꺼�ъ쓣��
					{
						$(".1120_zimg").hide();
						$(".1120_pimg").show();
						$(".1120_ztext").html( msr4_winUser + "��");
					}
					else //�뱀꺼�섏� �딆븯�꾨븣
					{
						$(".1120_zimg").show();
						$(".1120_pimg").hide();
						$(".1120_ztext").html( msr4_winUser + "��");
					}
					
		        } , 
				function(_error) {
				}
		);

	});
	
	$(".1149_btn_eq").unbind("click").on("click", function(){
		var winner = $("#1149_label_q").val();
		if( winner == "") 
		{
			alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
			$("#1149_label_q").focus();
			return;
		}	
		
		__ajaxCall("/common/js/openevent/pro1149_0414.js",{}, true, "json", "post",
				function (data) {
					var msr4_winUser = winner.toUpperCase();
					var msr4_winRank = "";
					var msr4_winCnt  = 0;
					
					$.each( data.people, function(x,y){
						if ( msr4_winUser  == y.USER) {
							msr4_winRank = y.RANK;
							msr4_winCnt++;
						}
					});
					
					if ( msr4_winCnt == 0 )	//�뱀꺼�ъ쓣��
					{
						$(".1149_zimg").hide();
						$(".1149_pimg").show();
						$(".1149_ztext").html( msr4_winUser + "��");
					}
					else //�뱀꺼�섏� �딆븯�꾨븣
					{
						$(".1149_zimg").show();
						$(".1149_pimg").hide();
						$(".1149_ztext").html( msr4_winUser + "��");
					}
					
		        } , 
				function(_error) {
				}
		);

	});
	
	
	
	
	$(".1085btn").unbind("click").on("click", function(){
		var winner = $("#label_q").val();
		if( winner == "") 
		{
			alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
			$("#label_q").focus();
			return;
		}	
		
		__ajaxCall("/common/js/openevent/christmas_week_user.js",{}, true, "json", "post",
				function (data) {
					
					var msr4_winUser = winner.toUpperCase();
					var msr4_winRank = "";
					var msr4_winCnt  = 0;
					
					$.each( data.people, function(x,y){
						if ( msr4_winUser  == y.USER) {
							msr4_winRank = y.RANK;
							msr4_winCnt++;
						}
					});
					
					if ( msr4_winCnt > 0 )	//�뱀꺼�ъ쓣��
					{
						$(".btn_smt_zimg").hide();
						$(".btn_smt_pimg").show();
						
					}
					else //�뱀꺼�섏� �딆븯�꾨븣
					{
						$(".btn_smt_zimg").show();
						$(".btn_smt_pimg").hide();
						$(".btn_smt_ztext").html( msr4_winUser + "��");
					}
					
		        } , 
				function(_error) {
				}
		);

	});
		$(".1102btn1").unbind("click").on("click", function(){
		var winner = $("#label_q").val();
		if( winner == "") 
		{
			alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
			$("#label_q").focus();
			return;
		}	
		
		__ajaxCall("/common/js/openevent/award_1_0104.js",{}, true, "json", "post",
				function (data) {
					
					var msr4_winUser = winner.toUpperCase();
					var msr4_winRank = "";
					var msr4_winCnt  = 0;
					$.each( data.people, function(x,y){
						
						if ( msr4_winUser  == y.USER) {
							msr4_winRank = y.RANK;
							msr4_winCnt++;
						}
					});
					
					if ( msr4_winCnt == 0 )	//�뱀꺼�섏� �딆븯�꾨븣
					{
						$(".btn_smt_zimg").hide();
						$(".btn_smt_pimg").show();
						$(".btn_smt_ztext").html( msr4_winUser + "��");
					}
					else //�뱀꺼�ъ쓣��
					{
						$(".btn_smt_zimg").show();
						$(".btn_smt_pimg").hide();
						$(".btn_smt_ztext").html( msr4_winUser + "��");
					}
					
		        } , 
				function(_error) {
				}
		);					
		
		
	});
	
	$(".1102btn2").unbind("click").on("click", function(){
		var winner = $("#label_q2").val();
		if( winner == "") 
		{
			alert("�뱀꺼�� 議고쉶�� �꾩씠�붾� �낅젰�섏꽭��.");
			$("#label_q2").focus();
			return;
		}	
		
		__ajaxCall("/common/js/openevent/award_2_0104.js",{}, true, "json", "post",
				function (data) {
					var msr4_winUser = winner.toUpperCase();
					var msr4_winRank = "";
					var msr4_winCnt  = 0;
					
					$.each( data.people, function(x,y){
						if ( msr4_winUser  == y.USER) {
							msr4_winRank = y.RANK;
							msr4_winCnt++;
						}
					});
					if ( msr4_winCnt == 0 )	//�뱀꺼�섏� �딆븯�꾨븣
					{
						$(".btn_smt_zimg").hide();
						$(".btn_smt_pimg").show()
						$(".btn_smt_ztext").html( msr4_winUser + "��");
						
					}
					else 
					{//�뱀꺼�ъ쓣��
						$(".btn_smt_zimg").show();
						$(".btn_smt_pimg").hide();
						$(".btn_smt_ztext").html( msr4_winUser + "��");
					}
					
		        } , 
				function(_error) {
				}
		);					
		
	});
	//SEQ=1157 �앹뾽 異붽�
	$('.ev_seq1157_img02 a.ev_seq1157_link1').bind('click', function(){
		$('.layer_dimm, .layer_popup_seq1157').fadeIn();
	});
	$('.layer_popup_seq1157_close').bind('click', function(){
		$('.layer_dimm, .layer_popup_seq1157').fadeOut();
	});
	//SEQ=1157 �앹뾽 end
});