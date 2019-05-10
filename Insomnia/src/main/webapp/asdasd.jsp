<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- JQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 구매하기 css -->
<link href="<c:url value='/vendor/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/custom.css'/>" rel="stylesheet">
<link href="<c:url value='/vendor/css/jquery.scrolling-tabs.css'/>" rel="stylesheet">

<script>
   $(function() {
      //구매하기 hide, show
      $('.option-btn').click(function() {
         if ($('#optionList').css('display') === 'none') {
            $('#optionList').show(1000);
         } else {
            $('#optionList').hide(1000);
         }
      });
   }); //function
</script>

	
</head>

<body >

<!-- 구매폼 -->
			<div>
				<div class="option-container">
					<div class="option-btn"
						style="font-size: 1.2em; width: 10px; height: 50px; padding-top: 3px; margin-left: 20px;">B
						u y</div>
					<div id="optionList" class="option-area" style="display: none;">
						<div class="option-area-content">
							<div class="option-area-content-step1">
								<div class="common-flex-between">
									<span class="option-title mt10 xs-mt25">Buy Tickets</span>
								</div>
		
								<div class="option-box option-box-blue">
									<div class="aa" style="display: contents">
										<div class="option-box-left" style="padding-top: 10px">
											<div class="option-box-amount">${bgs1.C_CONCERTDATE}</div>
											<div class="mt5" style="padding-top: 5px">
												<span><strong>52석 남음</strong></span> <span
													style="color: white">&nbsp;&nbsp;|&nbsp;&nbsp; 248석 판매</span>
											</div>
										</div>
										<form action="<c:url value='/Pay/PayPage.ins'/>"
											id="bgs_sub_item_list" style="display: none">
											<input type="hidden" name="bgs1_title" value="${bgs1.B_TITLE }">
											<input type="hidden" name="bgs1_content"
												value="${bgs1.B_CONTENT }"> <input type="hidden"
												name="bgs1_price" value=""> <input type="hidden"
												name="bgs1_qty" value="">
										</form>
										<div class="option-box-center" style="padding-top: 10px">
											<div class="option-box-title">${bgs1.B_TITLE}</div>
											<div class="option-box-desc mt5" style="margin-top: 10px">${bgs1.B_CONTENT}</div>
										</div>
									</div>
									<div class="box_inventory option_box_grey">
										<input type="hidden" name="limited_qty_yn" value=""> <input
											type="hidden" name="limited_min_qty" value="1"> <input
											type="hidden" name="limited_max_qty" value="999">
										<div style="padding-top: 1px;">
											<span class="txt_count_inventory option_title">수량&nbsp;&nbsp;&nbsp;</span>
											<input disabled="disabled" id="qtyqty" name="qty" type="text"
												value="1"
												style="color: white; background-color: black; width: 38px; height: 20px; text-align: center"
												class="input_add" onkeyup="checkQty(this);"
												onfocus="this.select();" style="line-height: 18px"> <a
												id="plus_ordered" href="javascript:void(0)"
												style="font-size: 1.5em">&nbsp;+&nbsp;</a> <a
												id="minus_ordered" href="javascript:void(0)"
												style="font-size: 1.5em">-</a>
										</div>
										<div style="padding-top: 2px">
											<span>금액&nbsp;&nbsp;&nbsp;</span> <span id="bgs_price"></span>원
											<script>
		                                              $("#bgs_price").text(String(${bgs1.C_PRICE}).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
		                                           </script>
										</div>
									</div>
		
								</div>
		
							</div>
		
							<div class="option-box" style="margin-top: -25px;">
								<div class="option-box-left">
									<div class="option-box-amount">${bgs2.C_CONCERTDATE}</div>
									<div class="mt5" style="padding-top: 5px">
										<strong class="font-pink">Sold out</strong> <span
											style="opacity: 0.5;">&nbsp;&nbsp;|&nbsp;&nbsp; 판매 완료</span>
									</div>
								</div>
								<div class="option-box-center">
									<div class="option-box-title">${bgs2.B_TITLE}</div>
									<div class="option-box-desc mt5" style="margin-top: 10px">${bgs2.B_CONTENT}</div>
								</div>
								<div class="hidden-xs option-delivery-date">
									<strong class="font-pink"
										style="font-size: 1.6em; margin-top: 200px">Sold out</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>