// console �녿뒗 browser ��鍮�
if (window['console'] === undefined || console.log === undefined ) {
	console = {log: function() {}, info: function() {}, warn: function () {}, error: function() {}};
}

// jQuery trim �섏� �딅뒗 寃쎌슦 ��鍮�
if(typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, '');
	}
}

// IE8 �댄븯�� isArray 吏��� �� ��
if (Array.isArray == undefined) {
	Array.isArray = function (obj) {
	    return Object.prototype.toString.call(obj) === "[object Array]";
	};
}


$(document).ready(function () {
	$("a[href=#]").attr("href", "javascript:void(0);");
	
	if (location.href.indexOf("/find_") > -1) {
		$(document).on("blur, keydown", ".input_warn", function () {
			$(this).removeClass("input_warn");
			$("#" + $(this).data("warn_id")).text("");
		});
	}
});


function showPopupCenter(url, winName, pwidth, pheight, scrollYN, resizeYN) {
	 var winL = (screen.width-pwidth)/2;
	 var winT = (screen.height-pheight)/2;
	 var spec  = 'toolbar=no';			// �꾧뎄硫붾돱
		 spec += ',status=no';			// �곹깭諛�
		 spec += ',location=yes';		// 二쇱냼愿��⑤찓��
		 spec += ',height='+pheight;	// �믪씠
		 spec += ',width='+pwidth;		// �덈퉬
		 spec += ',top='+winT;			// �몃줈�꾩튂
		 spec += ',left='+winL;			// 媛�濡쒖쐞移�
		 spec += ',scrollbars='+(scrollYN == undefined ? "no" : scrollYN);	// �ㅽ겕濡ㅻ컮 �щ�(湲곕낯)
		 spec += ',resizable='+(resizeYN == undefined ? "no" : resizeYN);	// 李쏀겕湲곗“�� �щ�
	 var win = window.open(url, winName.replace(" ", "_"), spec);

	 if(parseInt(navigator.appVersion) >= 4) {
		 win.window.focus();
	 }
	 
	 return win;
}

var m_regex_id = /^[-A-Za-z0-9_]{4,13}$/;
var m_regex_birth = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
var m_regex_email = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
var m_regex_hp    = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
var m_regex_tel   = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
var m_regex_pwd1  = /^((?=.*[a-zA-Z])(?=.*[0-9])(?=.*[`~!@#$%^&*()\-_\=+\\\|]).{8,})$/;
var m_regex_pwd2  = /^((?=.*[a-zA-Z])(?=.*[0-9]).{10,})$/;
var m_regex_pwd_text = "�곷Ц/�レ옄/�뱀닔湲고샇瑜� �쇳빀�섏뿬 8�� �댁긽 �낅젰�섍굅��,\n�곷Ц/�レ옄瑜� �쇳빀�섏뿬 10�� �댁긽 �낅젰�섏꽭��.";

function checkValid(_strSelector, _strMsg, _strType, _strMsg2) {
	if ($(_strSelector) == undefined) {
		return true;
	}
	
	var strValue = "";
	$(_strSelector).each(function (_nIdx) {
		strValue += $.trim($(this).val());
		
		if (_nIdx < $(_strSelector).length - 1) {
			switch (_strType) {
				case "BIRTH":
				case "HP":
				case "TEL":
					strValue += "-";
					break;
		
				case "EMAIL":
					strValue += "@";
					break;
			}	
		}
	});
	
	if (strValue == undefined || strValue.trim() == "") {
		if (_strMsg) {
			alert(_strMsg);
			$(_strSelector).focus();
		}
		return true;
	}

	if (_strType != undefined) {
		var objRegex = null;
		
		switch (_strType) {
			case "BIRTH":
				objRegex = m_regex_birth;
				break;
		
			case "EMAIL":
				objRegex = m_regex_email;
				break;
				
			case "HP":
				objRegex = m_regex_hp;
				if (strValue.indexOf("-") == -1) {
					strValue = getPhoneNumberStringFormat(strValue);
				}
				break;

			case "TEL":
				objRegex = m_regex_tel;
				break;
				
			case "PASSWORD":
			case "PASSWORD_CHECK":
				objRegex = m_regex_pwd1;
				if (strValue.length > 9) {
					objRegex = m_regex_pwd2;	
				}
				break;
		}

		if (objRegex != null) {
			if (objRegex.test(strValue.trim()) == false) {
				if (_strMsg || _strMsg2) {
					alert( (_strMsg2) ? _strMsg2 : _strMsg );
					$(_strSelector).focus();
				}				
				return true;
			}
		}
	}

	return false;
}

function checkValid2(_strTargetSelector, _strType) {
	var strValue = "";
	var msg      = "";
	var objRegex = "";

	$(_strTargetSelector).each(function (_nIdx) {
		strValue += $.trim($(this).val());
		
		if (_nIdx < $(_strTargetSelector).length - 1) {
			switch (_strType) {
				case "BIRTH":
				case "HP":
					strValue += "-";
					break;
			}
		}
	});
	
	if (strValue == "") {	// 媛믪씠 �놁쑝硫�..
		switch (_strType) {
			case "ID":
				msg = "�꾩씠�붾� �낅젰 �섏꽭��.";
				break;
			case "NAME":
				msg = "�대쫫�� �낅젰 �섏꽭��.";
				break;
			case "EMAIL":
				msg = "�대찓�쇱쓣 �낅젰 �섏꽭��.";
				break;
			case "PASSWORD":
				msg = "鍮꾨�踰덊샇瑜� �낅젰 �섏꽭��.";
				break;
			case "PASSWORD_CHECK":
				msg = "鍮꾨�踰덊샇瑜� �ㅼ떆 �낅젰 �섏꽭��.";
				break;
			case "HP":
				msg = "�대��� 踰덊샇瑜� �낅젰 �섏꽭��.";
				break;
			case "BIRTH":
				msg = "�앸뀈�붿씪�� �낅젰 �섏꽭��.";
				break;
			case "NICKNAME":
				msg = "�됰꽕�꾩쓣 �낅젰 �섏꽭��.";
				break;
		}
		return msg;
	}
	
	if (_strType) {
		switch (_strType) {
			case "ID":
			msg = "�곷Ц(���뚮Ц�� 援щ텇 �놁쓬), �レ옄濡� 4~13�먮━留� �낅젰 媛��ν빀�덈떎.";
			objRegex = m_regex_id;
			break;
			
			case "EMAIL":
				msg = "�섎せ�� �대찓�� 二쇱냼 �낅땲��. �대찓�� 二쇱냼瑜� �뺤씤�� �ㅼ쓬 �ㅼ떆 �낅젰�� 二쇱꽭��.";
				objRegex = m_regex_email;
				break;
				
			case "HP":
				msg = "�섎せ�� �대��� 踰덊샇 �낅땲��. �대��� 踰덊샇瑜� �뺤씤�� �ㅼ쓬 �ㅼ떆 �낅젰�� 二쇱꽭��.";
				objRegex = m_regex_hp;
				if (strValue.indexOf("-") == -1 &&  strValue.length < 12) { 
					strValue = getPhoneNumberStringFormat(strValue);
				}
				break;

			case "PASSWORD":
			case "PASSWORD_CHECK":
				msg = m_regex_pwd_text; 
				objRegex = m_regex_pwd1;
				if (strValue.length > 9) {
					objRegex = m_regex_pwd2;	
				}
				break;
			case "BIRTH":
				msg = "�앸뀈�붿씪�� �뺥솗�� �좏깮 �섏꽭��.";
				objRegex = m_regex_birth;
				break;
		}
		
		if (objRegex) {
			if (objRegex.test(strValue.trim()) == false) {	// �좏슚�� 泥댄겕
				return msg;
			}
		}
	}
	
	return "";
}

function addZero(number, length) {
	if (length === undefined) {
		length = 2;
	}

	var str = '' + number;
	while (str.length < length) {str = '0' + str;}
	return str;
}

function ___ajaxCall(_strUrl, _objParams, _bAsync, _strDataType, _strMethod, _fnSuccess, _fnError) {
	if (!_strDataType) _strDataType = "json";
	if (!_strMethod)   _strMethod   = "get";
	if (!_fnError) {
		_fnError = function(_error) {
			alert("泥섎━ 以� �ㅻ쪟媛� 諛쒖깮 �덉뒿�덈떎.\n�댁슜�� 遺덊렪�� �쒕젮 二꾩넚�⑸땲��.");
			try {
				$.commonLib.hideLoadingImg();	
			} catch (_e) {
			}			
			console.log(_error);
		};
	}

	var option = { 
		 type     : _strMethod
		,url      : _strUrl
		,data     : _objParams
		,async    : _bAsync
		,dataType : _strDataType
		,success  : _fnSuccess
		,error    : _fnError
	}; 
	
	if (_strDataType == "jsonp") {
		option.jsonp         = "callback";
	} else {
		option.scriptCharset = "utf-8";
		option.contentType   = "application/x-www-form-urlencoded; charset=UTF-8";
	}
	
	$.ajax(option);
}

function initBirth() {
	// �좏깮 �� ��,�붿뿉 �곕씪 �� �� 蹂�寃�
	$("[name='birth_year'], [name='birth_month']").on("change", function () {
		var nYear  = $("[name='birth_year']").val();
		var nMonth = $("[name='birth_month']").val();
		
		setDays(nYear, nMonth);
		
		$("[name='birth_day']").val("").trigger("change");
	});
	
	var dNow = new Date();
		dNow.setFullYear(dNow.getFullYear() - 14);
	var nNowYear  = dNow.getFullYear();
	var nNowMonth = dNow.getMonth() + 1;
	
	setYears(nNowYear);
	setMonths();
	setDays(nNowYear, nNowMonth);
	
	$("[name='birth_year']").val("").trigger("change");
	$("[name='birth_month']").val("").trigger("change");
	$("[name='birth_day']").val("").trigger("change");
}

function setYears(_nLastYear) {
	$("[name='birth_year']").html('<option value="">�좏깮</option>');
	
	for (var i = _nLastYear; i >= _nLastYear - 100; i--) {
		var $option = $('<option value="' + i + '">' + i + '��</option>');

		$("[name='birth_year']").append( $option );
	}
}

function setMonths() {
	$("[name='birth_month']").html('<option value="">�좏깮</option>');
	
	for (var i = 1; i <= 12; i++) {
		var nSaveVal = addZero(i, 2);
		var $option  = $('<option value="' + nSaveVal + '">' + i + '��</option>');
		
		$("[name='birth_month']").append( $option );
	}
}

function setDays(_nYear, _nMonth) {
	$("[name='birth_day']").html('<option value="">�좏깮</option>');
	
	var d = new Date(_nYear, _nMonth, 1);
		d.setDate(d.getDate() - 1);

	for (var i = 1; i <= d.getDate(); i++) {
		var nSaveVal = addZero(i, 2);
		var $option  = $('<option value="' + nSaveVal + '">' + i + '��</option>');
		
		$("[name='birth_day']").append( $option );
	}
}

function initEmail() {
	var arrEmail = ["daum.net", "gmail.com", "hanmail.net", "me.com", "nate.com", "naver.com"];
	
	for (var i in arrEmail) {
		var $option = $('<option value="' + arrEmail[i] + '">' + arrEmail[i] + '</option>');

		$("[name='email_select']").append( $option );
	}
	
	$("[name='email_select']").on("change", function () {
		if ($(this).val() == "") {
			$("#email_2").val("");
		} else {
			$("#email_2").val($(this).val());
		}
	});
}

function goWithPostData(_arrKeyAndValues, _strAction, _strTarget) {
	var id = "form" + $("form").length;
	
	var $form = $('<form id="' + id + '" method="post" />');
		$form.attr("action", _strAction);
	
	if (_strTarget) {
		$form.attr("target", _strTarget);
	}
	
	if (Array.isArray(_arrKeyAndValues) == false) {
		_arrKeyAndValues = [ _arrKeyAndValues ];
	}
		
	for (var i = 0; i < _arrKeyAndValues.length; i++) {
		var $input = $('<input type="hidden" />');
			$input.attr("name", _arrKeyAndValues[i]["KEY"]);
			$input.attr("id", _arrKeyAndValues[i]["KEY"]);
			$input.attr("value", _arrKeyAndValues[i]["VALUE"]);
		
		$form.append( $input );
	}
	
	$("body").append($form);
	
	$("#" + id).submit();
}

function getDateDiff(date1,date2) {
    var arrDate1 = date1.split("-");
    var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
    var arrDate2 = date2.split("-");
    var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
    
    var getDiffTime = getDate1.getTime() - getDate2.getTime();
    
    return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
}

function getDateStringFormat(_objValue, _strFormat) {
	if (_objValue == "") {
		return "";
	}
	
	if (_objValue == undefined) {
		_objValue = new Date();
	}
	
	if (_strFormat == undefined) {
		_strFormat = "YYYY-MM-DD";
	}
	
	switch (_strFormat) {
		case "YYYYMMDD":
			return _objValue.getFullYear() + addZero((_objValue.getMonth() + 1), 2) + addZero(_objValue.getDate(), 2);	
			break;
		case "YYYYMMDDHHMMSS":
			return _objValue.getFullYear() + addZero((_objValue.getMonth() + 1), 2) + addZero(_objValue.getDate(), 2) + addZero(_objValue.getHours(), 2) + addZero(_objValue.getMinutes(), 2) + addZero(_objValue.getSeconds(), 2);
			break;
		case "YYYY-MM-DD":
			if (typeof(_objValue) == "string") {
				return _objValue.substr(0, 4) + "-" + _objValue.substr(4, 2) + "-" + _objValue.substr(6, 2);
			} else {
				return _objValue.getFullYear() + "-" + addZero((_objValue.getMonth() + 1), 2) + "-" + addZero(_objValue.getDate(), 2);	
			}
			break;
		case "YYYY-MM-DD HH:MM:SS":
			if (typeof(_objValue) == "string") {
				return _objValue.substr(0, 4) + "-" + _objValue.substr(4, 2) + "-" + _objValue.substr(6, 2) + " " + _objValue.substr(8, 2) + ":" + _objValue.substr(10, 2) + ":" + _objValue.substr(12, 2);
			} else {
				return _objValue.getFullYear() + "-" + addZero((_objValue.getMonth() + 1), 2) + "-" + addZero(_objValue.getDate(), 2) + " " + addZero(_objValue.getHours(), 2) + ":" + addZero(_objValue.getMinutes(), 2) + ":" + addZero(_objValue.getSeconds(), 2);	
			}
		case "YYYY-MM-DD (HH:MM:SS)":
			if (typeof(_objValue) == "string") {
				return _objValue.substr(0, 4) + "-" + _objValue.substr(4, 2) + "-" + _objValue.substr(6, 2) + " (" + _objValue.substr(8, 2) + ":" + _objValue.substr(10, 2) + ":" + _objValue.substr(12, 2) + ")";
			} else {
				return _objValue.getFullYear() + "-" + addZero((_objValue.getMonth() + 1), 2) + "-" + addZero(_objValue.getDate(), 2) + " (" + addZero(_objValue.getHours(), 2) + ":" + addZero(_objValue.getMinutes(), 2) + ":" + addZero(_objValue.getSeconds(), 2) + ")";	
			}
			break;
	}
}

function getWeekDayText(date) {
	/* date : 2015-11-18 */
	var d = new Date(date);
	var week = new Array('��','��','��','��','紐�','湲�','��');
	return week[d.getDay()];
}

function getPhoneNumberStringFormat(_strValue, _strDelimiter) {
	if (_strValue == undefined) {
		_strValue = "";
	} else {
		_strValue = $.trim(_strValue);
	}
	
	if (_strDelimiter == undefined) {
		_strDelimiter = "-";
	}
	
	switch(_strValue.length) {
		case 8:
			_strValue = _strValue.substr(0, 4) + _strDelimiter + _strValue.substr(4);
			break;
		case 10:
			_strValue = _strValue.substr(0, 3) + _strDelimiter + _strValue.substr(3, 3) + _strDelimiter + _strValue.substr(6);
			break;
		default:
			_strValue = _strValue.substr(0, 3) + _strDelimiter + _strValue.substr(3, 4) + _strDelimiter + _strValue.substr(7, 4);
			break;
	}
	
	return _strValue;
}

function cutStrKor(str, len, dot) {
	if (dot == undefined) {
		dot = "..";
	}
	var s = 0;
	for (var i = 0; i < str.length; i++) {
		s += (str.charCodeAt(i) > 128) ? 2 : 1;
		if (s > len)
			return str.substring(0, i) + dot;
	}
	return str;
}

function getRewardSummary() {
	if (m_jsonRewardSummary == null) {
		___ajaxCall("/interface/getMsrRewardSummary.do", {}, false, "json", "post"
			,function (_response) {
				if (_response.result_code == "SUCCESS") {
					m_jsonRewardSummary = jQuery.parseJSON(_response.data);
				}
			}
		);
	}
}

function getSecureValue(_strValue, _nLength, _strMark) {
	if (_nLength == undefined) {
		_nLength = 2;
	}
	
	if (_strMark == undefined) {
		_strMark = "*";
	}
	
	var result = _strValue.substr(0, _strValue.length - _nLength);
	for (var i = 0; i < _nLength; i++) {
		result += _strMark;
	}
	
	return result;
}

function getGoldCardRegStatusText(_strStatus) {
	var text = "";
	
	switch (_strStatus) {
		case "A":	// �좎껌�묒닔
			text = "以�鍮꾩쨷";
			break;
		
		case "C":	// 諛쒗뻾�뺤씤
		case "Q":	// 諛쒗뻾�붿껌
			text = "�쒖옉以�";
			break;
			
		case "D":	// 留ㅼ옣�낃퀬
			text = "留ㅼ옣�꾩갑";
			break;
		
		case "E":	// 怨좉컼�몄쬆
			text = "移대뱶�깅줉";
			break;
			
		case "Z":	// 誘몄닔�뱁룓湲�
			text = "誘몄닔�뱁룓湲�";
			break;
	}
	
	return text;
}

function checkEucKr(_strText) {
	// �꾩꽦�� 湲��먰몴 (�쒓�/�밸Ц/�쒖옄 ��)
	var EUCKR_CHARS  = "媛�媛곴컙媛뉕컝媛됯컟媛먭컩媛믨컭媛붽컯媛뽮컱媛숆컶媛쏄컻媛앷컿媛ㅺ갔媛�갗媛곌갚媛멸갯媛쇨�嫄뗪콑嫄붽콠嫄쒓굅嫄깃굔嫄룰구嫄브�寃곴쾬寃꾧쾮寃녾쾳寃딄쾵寃뚭쾺寃붽쿇寃앷쿊寃좉깹寃④꺽寃り껄寃�껐寃멸껸寃산꼈寃쎄퀋怨꾧퀓怨뚭퀡怨쀪퀬怨↔낀怨㏐낏怨り낚怨�낡怨깃납怨듦낭怨쇨낸愿�愿꾧큷愿뚭킀愿뤾킅愿섍킐愿좉누愿ш눌愿닿뉘愿멸뉼援꾧탢援뉕탧援먭탷援섍덧援ｊ뎄援�뎔援녠뎬援듦독援산돔援쎄동沅곴텂沅덇텎沅뚭텗沅쒓텩沅ㅺ떱洹�洹곴톬洹덇톾洹묎퇂洹쒓퇏洹ㅺ렇洹밴렐洹욧�湲곴툑湲됯툔湲띻툝湲곌릴湲닿막湲멸맏源�源곴퉫源낃퉮源딄퉴源띻퉶源먭퉼源뽮튇源앷튋源좉묀源κ묠源⑷묵源곌뭏源밴뭘源쇨뭣爰꾧틗爰뚭볼爰쎄봅猿�猿꾧퍕猿띻퍘猿먭퍚猿섍퍢猿쒓빻猿リ뺌猿닿뻗猿쇨펶瑗덇펾瑗먭섕瑗�섟瑗꿸섦瑗쇨섹瑗욧퐗苑귢퐙苑덇퐠苑먭퐳苑앷숴苑κ슝袁�袁꾧푽袁먭풌袁뺢풙袁멸씁袁쇨�轅뉕퓞轅됯퓢轅띻퓥轅붽퓶轅④여轅곌엽轅닿옇���곷�꾨�뚮�먮�붾�쒕�앸�⑤걚�낅걟�딅걣�롫걪�붾걬�쀫걲�앸겮�쎈��꾨굦�띾굩�묐굹�숇굾�쒕궆�좊궊��궓�⑸궖�щ궘��궚�깅궠�대궢�몃궪�꾨깄�뉖깉�됰깘�묐깞�섎깲�λ꼫�됰꼱�뚮꼸�믩꼻�섎꽇�쏅꽌�앸꽔�ㅻ꽖�⑤꽟�대꽪�룸꽭�밸��곷뀈�덈뀗�묐뀛�뺣뀡�쒕뀪�몃끃�쇰��귣냸�됰냻�띾넂�볥넄�섎넑�⑤뇤�먮뇯�쒕뇺�잙눊�⑸눐�곕눢�삳눦�꾨늼�덈닂�뚮닎�뺣닓�숇닠�대댘�섎돏�좊돣�⑸돱�듬돹�꾨뒇�됰뒓�묐뒗�섎뒜�싲뒥�〓뒩�λ뒭�る뒳�곕뒾�덈땳�뚮땺�믩떂�숇떅�앸떌�ㅻ떏��떒�ル떖��떘��떝�대떟�룸떥�밸떧�삳떯���곷똾�덈뙋�묐뙎�붾뙐�쒕뜑�뺣뜓�섎뜘�쒕뜛�잙뜡�λ뜤�⑸뜪��뜲�깅뜶�몃��곷럠�꾨럢�뚮럯�붾렆�〓렓�щ룄�낅룉�뗫룎�롫룓�붾룙�쀫룞�쏅룤�좊룮�⑤뤌�먮릺�쒕맆�⑤맗�ル맭�먮몣�붾몮�좊몼�ｋ뫁�щ��덈뮑�ㅻ뮜�щ뮫�룸뮰���꾨뱢�먮뱯�쒕뱷�좊뱽�ㅻ벀�щ벊��벑�몃뵒�뺣뵖�쏅뵜�ㅻ뵦�㏓뵪�⑸뵬�곕뵳�대뵺���곷븗�꾨븙�뗫븣�띾븧�붾븳�앸븶�좊븸�좊뼞�ㅻ뼥�る뼨�곕뼮�노뼱�듬뼸�쇰뼺���꾨뿄�띾뿈�먮뿊�섎뿬�먮삊�붾삓�λ삱�대솃�ㅻ솳�쒕슍�좊슕�ル슠�깅썡�곕쎍�몃��곷쐟�⑤쑊�щ쑐�곕쑙�밸쑜�꾨쓧�뚮쓷�뺣씈�ㅻ씒�곕씝�노씡�쇰씫���꾨엺�띾옃�먮옉�믩옏�쀫옒�숇옖�좊옩�⑸옯�щ옲�대왂�몃웻�됰윭��윴�대읆�쎈읉���곷젃�덈젆�뚮젏�섎젟�쏅젥�ㅻ젰�⑤젹�대졄�룸졇�밸�濡꾨죷濡볥줈濡앸줎濡ㅻ＼濡�’濡깅「濡쇰쥗猶⑤ː猶대◀猷�猷곷즱猷낅즺猷먮짅猷앸짘猷〓（猷⑸，猷곕８猷밸；猷쎈쨪琉섎쩆琉쇰ㅍ瑜�瑜꾨쪒瑜뤿쪗瑜섎쪠瑜쒕쪧瑜⑤ⅸ瑜ル�瑜대Ⅵ瑜몃�由꾨쫭由뉖쫱由딅쫶由롫━由�┛由대┝由쎈┸留곷쭏留됰쭔留롫쭗留먮쭛留믩쭣留숇쭧留앸쭪留〓㎗留ㅻ㎘留⑤㎚留대㏊留룸㎏留밸㎈癒�癒곷쮫癒뺣㉧癒밸㉫硫�硫귣찄硫됰찇硫띾찊硫볥찓硫뺣찘硫쒕ħ硫λĸ硫⑤ł硫곕㈀硫대㈇紐껊챷紐낅챺紐뚮え紐⑸か紐щぐ紐뀀じ紐밸せ紐쎈쳞維덈쳵維숇ゼ臾�臾꾨쵋臾뤿쵏臾섎쵚臾좊З臾ルТ臾듬Ф臾몃Щ臾쇰Ы臾얜춣萸낅춪萸됰춱萸뤿춴萸붾춼萸〓�萸щ츍裕뚮츖裕ㅻ�裕щ�裕룸�誘꾨칷誘먮캆誘몃�誘쇰�諛�諛귣컝諛됰컠諛뚮컢諛뤿컩諛붾컯諛뽯컱諛섎컺諛쒕컼諛욌컾諛ㅻ갈諛㏓갑諛�같諛깅객諛몃�諭곷콇諭꾨콉諭됰콐諭띾콖諭앸쾭踰낅쾲踰뗫쾶踰롫쾾踰뺣쿁踰숇쿅踰좊깹踰ㅻ꺌踰⑤껐踰깅껙踰대껨踰쇰꼍蹂�蹂꾨퀙蹂뤿퀜蹂묐퀡蹂섎퀨蹂대났蹂띕낯蹂쇰큵遊낅큸遊됰킄遊붾뇬遊щ�逾덈탧逾뚮탳逾섎탽逾ㅻ델遺�遺곷텇遺뉖텋遺됰텏遺먮텘遺볥텞遺숇텥遺쒕땄遺곕떳酉붾퇄酉섎퇋酉⑸럭酉대렇釉�釉껊툍釉뚮툖釉먮툝釉쒕툦釉잙퉬鍮낅퉰鍮뚮퉶鍮붾퉽鍮쀫튃鍮싲튆鍮좊묀鍮ㅻ묠鍮る물鍮깅뭄鍮대뭇鍮삳뭡鍮쎈�類꾨틠類띾틣類먮틧類섎틯類⑤퍙六묐퍝六쀫퍡六좊빰六ㅻ빳六щ펯堉덈펹堉섎폎堉쏅폒堉앸�戮곷퐚戮덈퐧戮묐퐬毓붾쒼肉낅퓣肉띾퓧肉붾퓶肉잙에�쇱걨�섏걶�좎겏�⑹굪�묒굱�섏궇�≪궍�μ궗��궚�곗궠�댁궢�띠궪�쎌궭���곸깄�덉깋�뚯깘�섏깧�쏆깭�앹깶�μ깿�ъ꺎�듭꺑�뱀��꾩꼫�먯꽀�쒖꽍�욎꽏�좎꽔�ㅼ꽗�㏃꽟��꽢�곗꽦�띠꽭�뱀꽱���덉뀎�뗭뀒�띿뀛�뺤뀡�쒖뀮�μ뀱�⑥뀳�곗뀾�몄냵�뚯냽�롮넀�붿넆�쒖넔�잛넚�μ넧�⑹넭�곗녆�꾩뇠�뚯뇯�쀬뇴�좎눃�⑥눖�깆눛�쇱눦���꾩닃�띿닆�묒닔�숈닚�잛닠�⑥닶�レ댂��댇�뀁댋�덉뎽�묒돁�섏돖�μ돩��돭�댁돹�쎌돽�곸뒋�됱뒓�섏뒟�앹뒪�μ뒯�ъ뒴�댁뒿�룹듅�쒖떇�좎떍�ㅼ떕�ъ떗��떛�띠떥�뱀떩�쇱��덉뙃�뚯뙇�볦뙏�뺤뙓�쒖뙟�μ뙣�⑹뛿�⑥뜦�ъ뜲�뀁뜽�뱀띁�쎌럡�덉럩���섏룞�쒖룦�좎룫�⑥룴��뤃�듭뤈�덉릱�ㅼ맟�곗맭�쇱맼�덉뫀�μ뫅�ъ뫒�듭뫗���붿뮏�몄뮳�⑹벐�깆벖�몄벟�우��곸뵆�먯뵒�쒖뵪�⑹뵮�곗뵺�뱀뵽�쎌븘�낆븞�됱븡�뚯븤�롮븪�붿븬�쀬븯�숈븴�욎븷�≪븻�⑥빊�깆빏�댁빑�쇱빟���꾩뻼�뚯뼃�륁뼇�뺤뼏�섏뼔�좎뼦�댁뼲�몄뼶�살뼹�쎌뼻�꾩뾽�놁뾿�덉뿁�딆뿄�롮뿉�묒뿏�섏뿞�≪뿣�μ뿬��뿮�곗뿴�띠뿷�쇱뿽�얠뿿���곸쁾�놁삀�덉삅�먯삓�숈삗�쒖삤�μ삩�ъ삲��삹�녹샂�듭샆�뱀샍���곸셿�덉솏�묒솓�붿솗�쒖솣�좎솷��솼�몄쇆�쇱��덉쉲�뗭쉷�붿슃�섏슌�ㅼ슖�㏃슜�곗슧�댁슱�뱀슳���곸썐�낆썙�띿썝�붿썫�앹썱�≪썾�⑹쎂�곗쎑�뱀쎖�꾩쐟�덉쐧�붿쐲�쀬쐷�좎쑁�ㅼ쑉�곗쑒�녹쑖�룹쑝�쎌��꾩쓪�뚯쓭�륁쓳�믪쓶�붿쓹�뽰쓼�섏씄�좎씒�レ씠�듭씤�쇱씫�얠엪�꾩엯�뉗엳�됱엸�롮옄�묒옍�뽰옑�섏옔�좎옟�ｌ옢�μ옦�ъ옲�곗옿�쇱왌�우��곸웼�됱윁�롮윇�섏윚�ㅼ윩�ъ��곸쟾�덉젇�먯젒�볦젙�뽰젣�앹젨�ㅼ젹��젽�깆졇�쇱�議덉죮議뚯죲議붿“議깆〈議몄『醫�醫곸쥊醫낆쥍醫뉗쥕醫뚯쥗醫붿쥫醫잛⇒醫⑥♠醫쎌즲二덉즺二붿짆二쀬짍二좎！二ㅼ５二쇱＝以�以꾩쨫以놁쨲以띿쨵以묒쨾以ъㅄ伊먯쪗伊붿쪟伊좎ⅰ伊ｌ�伊곗Ⅴ伊쇱쫰利됱쫵利먯쬁利숈쬄利앹�吏곸쭊吏뉗쭏吏딆쭚吏묒쭞吏뺤쭡吏숈쭦吏쒖쭩吏좎㎖吏ㅼ㎣吏ъ㎛吏�㎞吏깆㎏吏뱀㏈夷�夷덉쮬夷뗭쮯夷띿쮷夷섏Ł姨뚯찉姨먯찓姨쒖찟姨잛찤姨≪ŀ姨쎌챷履섏ぜ履쎌�已꾩쳧已띿쳪已묒쳯已섏쳶已좎ガ已댁쵆弛먯쵒弛섏쵟弛≪춠彛덉춬彛뚯춴彛섏춽彛앹�彛몄�怡쒖�易붿�易㏃�李뚯컢李먯컮李쒖컼李≪각李㏃감李⑹갔李�같李몄갯李살갸李쎌갼梨꾩콉梨덉콐梨붿콝梨쀬콠梨숈콬梨ㅼ괜梨⑥굅梨듭쿂泥숈쿇泥좎꺼泥⑹껀泥ъ껌泥댁껨泥몄꼈爾꾩퀏爾뉗퀔爾먯퀠爾ㅼ낚爾곗큱珥덉큺珥뚯킄珥섏킍珥쏆킑珥ㅼ뇽珥ъ뉩理쒖턄理ㅼ뎄理�뎐理깆돋異덉텛異뺤텣異쒖땄異μ때異⑹떠痍꾩톸痍먯랬痍ъ럭痍몄레痍살렘痢꾩툑痢뚯툝痢숈툩痢≪륵痢⑥린痢깆립痢듭튂移숈튇移잛튌移≪묠移⑹무移�뭅移듭뭏移쇱틖罹낆틚罹됱틦罹묒틪罹섏틺罹≪베罹ㅼ벤罹ъ벼而곸빱而μ빻而レ뺄而댁뻐而룹뻗而뱀�耳곸펲耳덉폁耳묒폆耳뺤폒耳좎샴耳ъ서耳�섟耳깆섯肄붿퐬肄섏퐳肄ㅼ쉈肄㏃쉘肄곗쉽肄댁슛苡�苡낆풄苡≪쑬苡곗퓙荑좎에荑ㅼ엥荑곗엽荑녹영荑쇳���꾪�묓�섑���댄�듯�명�쇳걚�낇걞�됲걧�뷀걯�좏겕��겙�댄겮�쏀굙�ㅽ궏�⑦궗�댄궢�룻궧���곹깂�덊깋�먰깙�볧깞�뺥깭�앺깲�ㅽ꺃��꺈�고꺊�명꼵�고꽦�댄꽭�블��곹뀇�꾪뀉�뚰뀓�먰뀛�쒗뀦�잜뀫�⑦뀶�쇳냴�덊넗�≫넠�⑦넱�깊넶�듯녂�쇳��섑눜�명늾�됲닇�ы댂�고댋�쇳댙�욱뎮�덊돏�ㅽ��곹뒆�덊뒓�묓뒘�쒗뒥�ㅽ뒳�깊듃�뱁듉�욱��귦땲�됲땵�뷀떂�쒗떎�ν떚�깊떞�명��곹똽�낇뙆�랁뙉�먰뙏�뽱뙗�앺뙚�좏뙜�ν뙣�⑺뙩�고뙵�뱁뙸�쇳뙺�꾪뛿�쇳띂���꾪럩�랁럮�먰럱�섑럺�쒗렆�⑦렔�ロ렚�댄렪�쇳룄�낇룉�됲룓�섑룪�ｍ룷��룿�댄뤌�쏀뤏�곹릦�앺��꾪몴�좏뫀��뫍�명뫗�쇳뫟���귦뭹�됲뭼�랁뮅�⑺뱦�먰뱮�쒗뱹�⑦벉�고벝�삵벥�꾪뵂�뚰뵒�뺥뵕�쇳뵿���꾪븣�랁븦�묓븯�숉븳�좏븼�⑦빀�ロ빆�댄빑�명빞�꾪뻺�뉙뻽�됲뼆�ν뿀�됲뿄�먰뿋�섑뿖�쏇뿚�ㅽ뿥�⑦뿬�댄뿵�룻뿹���곹쁽�덊삉�묓삌�뷀삎�쒗삝�ㅽ삲�명샊�쇳��낇솃�됲솇�랁솑�뷀솗�섑솢�㏉솴�고솼�댄쉩�낇쉶�랁쉺�뷀슍�잜슒�⑦슠�고슲�삵썑�낇썕�뚰썞�뷀썤�숉썱�ㅽ썾�고쎎�쇳쎖���꾪쐭�섑쐷�쒗쑀�⑦쑊�ロ쑎�댄쑖�명쑝�꾪쓦�됲쓲�묓쓷�뽱쓼�섑쓾�좏씉�ｍ씎�⑺씗�고씠�쇳씫�곹엳�됲엺�먰옒�숉옕��";
		EUCKR_CHARS += "���곥�궰룐�β�┑ⓦ�꺿�뺚닪竊쇄댘�섃�쇺�쒋�앫�붵�뺛�덀�됥�듽�뗣�뚣�띲�롢�뤵�먦�뫢궁쀃룐돖�ㅲ돟�왿댋째�꿎�년꼦�ワ퓼占∽엠�귘��졻뒫�믠늹�뉍돘�뮻㎮�삘쁿�끸뿃�뤴뿇�뉍뾾�△뼚�년뼯�썩뼹�믠넀�묅넃�붵�볛돦�モ닖�썩닜�듈닽�р늿�뗢뒉�뉍뒄�꺿닼�⒱닱�⑨엑�믠뇯���꺜댐퐵�����쨍�징쩔���닊�뤒ㅲ꼮�겸뾹���룐뼳�ㅲ솧�△솯�㎮솭�쇺뿀�ｂ뿉�묅뼊�ㅲ뼢�ⓥ뼤�╈뼦�ⓥ삈�롡삙�왖뜯�졻�△넅�쀢넍�뽦넊��솴�も솷�욍닚�뽧룈�㏂뢿�섃꽒���돻竊곻펰竊껓펲竊낉펵竊뉛펷竊됵펺竊뗰펽竊랃펿竊륅폁竊묕폃竊볩폇竊뺧폋竊쀯폍竊숋폏竊쏉폒竊앾폔竊잞폖竊∽샨竊ｏ샴竊ο샷竊㏆섀竊⑼섈竊ワ섕竊�석竊�섟竊깍섣竊놂섦竊듸섬竊뤄섯竊뱄성竊삼엡竊쏙센竊울�節곻퐘節껓퐚節낉퐜節뉛퐟節됵퐡節뗰퐣節랃퐥節륅퐧節묕퐩節볩퐫節뺧퐭節쀯퐯節숋퐱節쏉퐳節앾엔�긱꽧�녈꽩�듐꽫�룔꽭�밤꽯�삠꽱�썬꽳�욍��곥뀆�껁뀈�끹뀊�뉎뀍�됥뀏�뗣뀒�띲뀕�뤵뀗�묆뀙�볝뀛�뺛뀟�쀣뀡�쇻뀣�쎼뀥�앫뀧�잆뀪�▲뀬�ｃ뀮�γ뀰�㎯뀲�⒲뀴�ャ뀶��뀸��뀺�긱뀼�녈뀾�듐끀�룔끂�밤끆�삠끉�썬끍�욍��곥냲�껁냴�끹냶�뉎냸�됥냺�뗣냼�띲냾�겸뀻�꿎뀽�닳뀿�뜯끁�멤끃�졻뀫�™뀭�ㅲ뀯�╈뀱�ⓥ뀳����������������科誇課跨過鍋顆廓慣棺款灌琯瓘管罐菅觀貫關館刮恝������������귘뵆�먥뵖�붴뵜�р뵥�닳뵾�곣봼�뤴뵑�쎻뵕�ｂ뵵�モ뵽�뗢뵠��뵪�룐붃�앪뵲�β뵺�귘뵏�묅뵚�쇺뵔�뺚뵊�띯뵞�잂뵡�™뵧�㎮뵫�も뵯��뵳�꿎뵷�뜯뵻�뷜뵿�얄��곣븗�꾟븙�녳븛�댿븠�듽럶�뽧럸�볝럹�꾠렍�ㅳ렏�╉럺�싥럾�쒌렃�욁렅�졼렊�㏂룋�띲럫�뤵룒�덀럦�덀렒�ⓦ렟�긱렡�녈렣�듐렧�룔렪�밤��곥럟�껁럡�뷩렮�쇈렰�얇렲�먦럱�믡럳�붴꽗���곥럧�뗣럩�뽧룆��렜��룢�⒲렕�ャ렗�앫룓�볝룂�됥룣�녍녍먃つ┙꼼옮겷샚뮻봤왙┖듽돖�▲돚�ｃ돞�γ돡�㎯돣�⒲돦�ャ돩��돫��돭�긱돯�녈돱�듐돳�룔돵�밤돷�삘뱪�묅뱬�볛뱮�뺚뱰�쀢뱲�쇺뱴�쎻뱶�앪뱸�잂뱺�△뱼�ｂ뱾�β벀�㎮벂�⒱몺�△몾�ｂ뫀�β뫂�㎮뫅�⒱뫇�モ뫊��뫌쩍�볛뀛쩌쩐�쎻뀥�앪뀧챈휃챨침캇캐캡�흢첩흹횩첸큘흯흭���곥늹�껁늻�끹늽�뉎늿�됥닁�뗣닃�띲닅�뤵닇�묆닋�볝닎�뺛닑�쀣닔�쇻닖�쎻뮏�앪뮒�잂뮔�△뮖�ｂ뮘�β뮚�㎮뮜�⒱뮞�モ뮠��뮢��뮥�기뮧�년뮪�듈뫒�듈뫔�룐뫖�밟뫚�삘뫜�썩뫞�욋��곣뭳쨔짼쨀�닳겳�곣굚�꺿굜�곥걗�껁걚�끹걝�뉎걟�됥걡�뗣걣�띲걥�뤵걧�묆걩�볝걫�뺛걭�쀣걯�쇻걳�쎼걶�앫걻�잆걽�▲걿�ｃ겇�γ겍�㎯겏�⒲겒�ャ겕��겗��겙�긱겛�녈겢�듐겤�룔겦�밤겫�삠겮�썬겲�욍��곥굚�껁굜�끹굞�뉎굠�됥굤�뗣굦�띲굨�뤵굪�묆굮�볝궊�㏂궍�ㅳ궏�╉궒�ⓦ궔�ゃ궖�с궘��궚�겹궞�꿔궠�담궢�뜰궥�멥궧�뷩궩�쇈궫�얇궭���곥긾�껁깂�끹깇�뉎깉�됥깏�뗣깒�띲깕�뤵깘�묆깚�볝깞�뺛깣�쀣깦�쇻깪�쎼깭�앫깯�잆깲�▲깴�ｃ깶�γ깺�㎯깿�⒲꺁�ャ꺃��꺇��꺉�긱꺋�녈꺎�듐꺐������������������鬼龜叫圭奎揆槻珪硅窺竅糾葵規赳逵閨勻均畇筠�菌鈞龜橘克剋劇戟棘極����������������";
		//EUCKR_CHARS += "鴉썰슁�뉐꺓�졾룾�드뱿�됧쳛若뜻쉯�뜻왅��춯�귞뾺葉쇠떅�꾥죿熬덅㉥蘊덅톽邕삭엡蓼뺝댗�닷릢�ゆ뀮餘쇘룒�싪┷鰲믧뼠堊껃닁罌얍Ⅸ冶�묾亮방뇞���녷윭旅욘풓�롧쐦髥든쮫塋욜가�앲돫�김カ�볞무�앮쎐歷당∀塋�몳筽먫쓮�ⓨ떂�롥젶葯뚧꽏�얏닡�€윉艅꾣툤�섊뼰�ｇ옺榮븅궚�묌몤榕뺝뙞略х뵴�쏃��섇돍�덂쭨略▼킋佯룟성壤딀끁黎잏빜�녺퀬永녕떡獰뚩뀛�↑뼇蜈곮쵙�쇤솉浴뉏퍔餓룟�뗥눘櫻뤸꽬�얏뀲�방㎦轢묊뼢�녺썣嶸뉓뒫�뗰��㏝뼀��若℡쓳甸곭껙獰백넻�ⓨ렮掠끻랬�믤뜮�싨벁歷좂궗曄쏂퇌甕욑쨧�썽뎲�멧뭬餓뜹겈藥얍뻠�녷쪞�김솕癰뉔뜷蟯ヤ튊�묉씛旅��됧뒐�믤あ�쇤닇容붷뒲��엾�덃넩��뱤�쇗챷嚥��덅─�붷쟿�썹뒳�꾤돌濚�궔誤뗨��ｉ탴�됪군逆붺탳煐븃ª�쇗뀏嶸앲쵗�쀩럩雅т퓫�욃궬�녶땫�띶띅�겼쥊佯싧풌�뜻넭�롦빃��슶�닸쥥易뉒굝�긺뮓�η뱤�숂＼髥х쳼塋띄탢泳볢�뺠�욤꽋�뽬�雍뺡�뺡룪�껈졇要싮�岳귛븪�뷴쪗耶ｅ콊�멩닋旅귝ː汝ⓩ벳�뚨쇅髥롧㉬楹사무濚쇠쮫沃↑걀�롩톬�ㅵ룴�듿뫏�뷴쭛耶ㅵ갱佯ユ떣�룡븙�꿩슑��쭅亦썹뿼�먪씭葉욜풐�껇궊�뤺떐�썼룿�곮젿熬닺ぅ甸껇풙��썔窈㏝쳵庸볟벊�쎿쎊歟뤹�瘟룬턄�겼씍若묉쁿歟길즻譯양맖熬욇�黎⑨쨪謠ⓧ풘�у뀻�잌춸藥ζ걧��떛�㎪뵽�숂㈉�ｈ깻�뤶림野→늿�쒐뱶燁묋룗沃뉓げ瓮③걥�뗩죫兩볠㎤�욥꺆甸끻넗若섇��ｆ：轝양걣��뱲嶸←퐧�낁�縕ラ뿙繞ⓨ댃�앮떖�귚풁�됧뙜鶯쇿빰�졿뉨�싩땬�뽫춴�깁몳��럾營ヤ퉾��櫻듿짗�ゆ꽘�먩쭚邀곩츕榮섋궞饔잋벡�묈뮠�у쵊蒻졾랫�ゆ븥�→찇�←쉸��턂玲배넗�롨썯雍껇퐥�딃쨨要뺡�訝섆퉭阿앬퍐岳긷끁�얍��ｅ룯�롥삍�드옠野뉐텊兩먩눥�섉븨�멩윪礪뗦춴驪녷�黎귝틶�며떁�뽫릡�욜윪令띄동�됭눥�낁닁�잒、玉녘낵邕��묌궞�ㅹ듁蓼믧찁褥⑶퇆榕쒎쐦掠��딃옞�ラ병�쏁첋獰ㅸ짍邕띺깳��掠덃럹囹잌�凉볡㈈囹�뒑翁у��댏�멨뜼�덃떝�꿩쵈曆껆쑘�η뜔�②뭉�뺞쑛輿껅쉼屋�퍕耀뗰쨬�룡�縕닻Ъ甸뉐룶��쪔�녷㎉�ょ죪囹븀쳟楹얕뫓誤뤺뎨�들뼥�삣쓦�뉒췅�뚪닞甸덃찘�뗥뎸�뉑닟汝섉Ⅵ�쇿깄�ㅵ떎�껅뼡�방㎰�양춮�배룶誤꿱Ч瓦묌쪏甸됦퍓倻쀦뱬�묉첁�당쫨獵썼뒰烏얕×蜈잞쨰�╊펻�딀�ζ돮黎꿰킎永╊틮�®윘��펯鴉롥끀���쒎솳�삣읃�쇔쨺也뉐쫼野꾢쾺若롥런亮얍퓣���쀦뿣�욄쐿�욄즹汝꾣찣轝뷸간黎썸쾫曆뉒럹��맚�귞뮗�며빣閻곭／曄곭쪍曄덄�嶸뺟�泳븀푽�녻��굦鼇섋춳穩덅돈�↓뙟繇�쪗蟯롩쮲要ι틨渶듾슐�됪떘旅붼뇫�ュ꽯甸뗰쨲夜쒏눇甸띷땹�울쨴甸륅쨶甸묕쨸甸볣궍甸뷂쨻甸뽳쨽甸섋ゾ甸숋쩀甸쏉쩂�뽳쩃�뽳쩄甸잓썵甸졿뜌�뷴뜔甸→옃璵졿뭄甸®뵹甸ｏㄴ甸η킀甸�ㄷ烏꿨썗夜섓ㄸ甸⑼ㄺ甸ワㄼ阿껓ㄽ�㎩쪎�계�먲ㄾ也녑뭅�싩쭒恙득겕�덃띀野㎩캌�わㄿ也닷섄�믭ㅀ甸깍ㅂ�숋ㅃ甸댐ㅅ甸띰ㅇ甸면쭛甸뱄ㅊ甸삼ㅌ甸쏙ㅎ甸울�畑곻쪈畑껅퓘畑꾬쪋�욤쓰�깍쪌畑뉓뀰畑덌쪏弱울쪐畑뗰쪒畑랃쪔畑륅쪖畑묈ォ鼇ζ씧榮먲쪙畑볩쪛畑뺧쪝畑쀨꺗畑섓쪠弱쇗낄�욘볶鸚싪뙳訝밥볘鵝녶뼫�섇즵壤뽪뼴���餘득퉵��ク怜욅퇍�뗨쥝�꿴뜘�삥씨�븀뼵�붷븭�띷녂�붹썔曆→튆逆�씁�계걙�썼븕誤껇쳡鈺싮뙚亦볡븪嶺붻툘�앭뵍�귛줁亮€늾�욄짛�띄퀢�녜빻餓ｅ엳��ㄷ弱띶껑躍뜹푷�닸뱻�녘눣熬뗨껴�딃퍤若끻쓿�녑�믣��겼쐳�드죿弱롥콬約뜹텑佯�풎�쇗뙌�됪릹旅껅９輿귝퇇歷→퍝嚥ㅷ눧�쒐씥獵긺㉪�꾥┤蘊�럼癰덆�껈�붼걪�썽뜊�띌윘驪믥�녺돇�®뜥�ｇ┸影ㅷ틳溫�罌⒵깈��뿽�얏쾶�욅뇡穩싮젗阿�챳餓앭넭�띶땿�뚧넦�길죶汝잍킒逆쇘뼹�녕ゥ�닺몿�끻뀥�쀦씄�볡뿕塋뉓뜵畑싪콊�쀩젺掠���싮걖��닄孃쀥텩艅숂뇠�사춬�ㅸ쵂�㏝��뉑눞畑쏁솴獰낁샒�븃８�륅쪣域쏁깧�욅덧�쏙쪤�ら㎟畑욂틓�득쵂轝믥�양닗��툧�뚩쐽葯먩뱿�ф쵔嚥ョ콇瀛쒑뿆蜈ㅸ┰�됭뇴�잌퍓�쀦뎁�쇘릣��엩�욂푺若띶풝�듿넽�좂븼雅��녶뀳�됪쥈與묊껍暎긺낍��쳮雍쏃뇧堊뜹꽬�드몔兩ф뀸�얏뾽輿싨옛鹽よ뿙�ｉ뼪要�ø墉쀩퍗�쎿썓閭루�앯ㄻ饔�쓡�먩��ｆ샬�됬뭺渶닺겘��샷�ｉ뜇�썲닓�ｆ큿�덅즰兩됪뻷餘�퓗怜양뜷餓ㅴ섬�뱄쪦略뷴떵�쒐렡寧�풗玲롨걝�욇댋�띌쓧�섌숯堊뗦쑨獵�넺�룟떈畑졿뭹�꾣쳯逆욅�섊닇�㎬�곮쁿�쒑러雍낂쑓邀�렉埇든쥖曄욜텭�됮똾埇욥틩獄뽩짘凉꾣쑇�㎫뱩映좄겲�←�①돚髥딂퀌蘊싪낫�룝틙�싧�兩뽪뼑�롧셽��걡�쇤겮遼㏝풅鶯섇쯽掠€쮶曆싨폀�사눕潁룩뵞筽면룮�뗥뒌�믤윹礖닸탛繹쒐�뤹릧�좂븰�ㅷ∥玉ч줊��댃�멧풒�ュ킍曆ょ떳雍ゅ풃�꾣젛畑↓쉮�믦굥�쒎뇤璵욅쯀泳얕뤀�듕퓴�⒴럹�뤷뵊掠ζ궒�롦˘役х뒃�며릤�껓ⅱ�®괵營밭씀�됭즽獒↓뇤�먬썴慾됧맃逆양뇪�섋뿺翁ら슔浴쀩틹�쀦톷�녘눊�뽫젹塋뗧쵟暎믤뫆�ょ뿲閻쇘（腰ч춸墉삣캖亮뺞폖�쒑렖�덁툏�띶Ł藥믣퐥�€뙺�⒵쎕譯욘섐�ｇ옚�ц뵑�삭폆耀낂갱�쒏듅�ユ껀�됭ⅹ�뷰벙倻꾢퓲恙숁쐹泳꿰퐫�믦뙧�썼폔�쇿윀倻밧첅野먩삨�싨쥌驪뤹뀮營듣껭蘊ｉ굙邀낁꼫縕딃솈要�墉ε췃麗볡뙖�꿰썯�뚦넪誤볟뀓�뺝땳汝됪쾾�꾤쑀泳욜랸��볕譯낁뵎�ε릫�썸삇�앮ㄷ繹잏슼�묋뙒�귟옝�⑶뒛褥닺쥉堊�넂�잌쭍躍썸뀞�멩뫗��윇與→칾驪쏁돓�←몓�며윖�쀨듉�낁�玉②쾶�ⓩ쾺�㎫쎅��찂傭⒵�亦믣ㄲ��뮋��쥞倻쇿퍨�뤸샂�녔맏�ョ쳴�쀩뙣�쇿략��뇣�딀땱�ユ뿞璵숁�驪뗧꽒�루븴濚녻닞�귟빁沃ｈ꼬�㏝덧罌③퍡�묈닅�삣븦�뉑굡榮딁큾�욆쉳����떯亦뺟돥�녑첍弱얍탩壤뚦쒜�ゆ‰璵ｆ맑疫꾤쐣映녕풆�뉓쵌瓦룬씉容닷껭�뜻꼵�ユ븦�삥뿼麗묉날�잏룊渶↓뼌野녻쐺玉먨돑�싨땷�뤸뮧�닸㉧力딁��욅츛暎뺟툤�딂댍�꾥엮�백쭅鴉닷뜇�띶룢�뚧맟���묉쭇力�퐯��븫�®썶�쇘즾髥사ㄼ永녻닾�좄퓭�믧／�껅땾�ζ륵逆묊쇊瓮뗩넲��ギ邀껃�ｅ굧�듿┬弱ⓨ퉯壤룡댛�얏뼶�곫삂�뗦쬅譯귞즳榮↑궕���ヨ뒽�↑쉶鼇よ쵕��삻榕먨�띴엿畑ｅ읂孃섉떆�믤씚疫껆꽇�껇깒�싪４獒듣쨿蘊좄섄�띺솵鴉�쉼躍쎿윆�®쇋�얗춣亮→쮭�⑴뇯�わⅳ濚곮븗�⑶짒鴉먪춳營곈뼢�▼툎歟득갼黎롦퀧��칱�껅퀡�뷴꺕�덂즯�섉첊�㎫솘閻㎬삒��쑚畑ε뜛凉곮츏渦②쒸�듿닪�ι콍庸덁툢�귛뀿掠쎾뭍�욄샋�꾣즳�녕봺�끿쭑塋앲샹繞좈쮫岳앭젩�긷����域묉뭔逆썹룮�ヨ룴獒쒑쨹鈺쒑폇鴉뤷깢�먨뜙若볟쑴�띸쫸�배뙬�붻쨭誤녻섰雍삯┘欲믤쑍阿뜸옇也됧컖約�낡�㎪짂�썹넞�ョ릊�ц쐜��땼褥념툖餓섆엷�끻돃��맔�먨윝鸚ュĳ耶싧�野뚦틵畑�돳�룡뼤役�벤�띄Е怜욜섬�먫뀘�싪��숃렔鼇껇쿋蘊�내壅닺떵�③뇸�쒒셿蓼숅낍�쀥늽�⒴쇀罌녑쪛也�옜�ㅶ돫�먩굶�싩썓暎됬퀪榮쏂뒳蘊곲쎇畑㏛퐲凉쀥슴�귛누�뗦짎簾쇘퉫俑т툞�쇿뙐�ゅ뜎倻껃đ佯뉑궟�딀뎶�방뼆�뉑├驪붹캋驪쀦캍亦몌ⅷ�든뿺�믥쥜燁뺟쭣暎껆톷玲↑궏�얕뇗�꿱쐸獒②す鈺ц꼇�숅씆繇쏃섶�уИ壤ф뼂茹녔�役쒏엽�뺟돑��꺌蘊볣졎�묉갬�섌쮤阿띴틟雅쎽퍞鴉뷰세鵝요퓺�욕뤁�멨봿�ｅ썪鶯ュⅱ夜묈�野뷴컙藥녑릊孃숁�앮뜥�쒏뼬�뜻읅歟��亦숁퀣歷ｇ�됬뛿�귞ㅎ曄�曄좂쭅影⑴킋永꿱굞�띹럫�묋썔獒잒찎屋욆쵛蘊쒑덱渦�궕繇쇤쭫墉앭뎷畑⒵쐱畑ゅ굹�ゅ굇�ｆ콝�딁뵣�앯츞�쒒끂�겻뭍�믤��욆뼦訝됵��됪．歷쀨뒣�섋∥�룡푳�믧¿訝듿궥�뤷꽏�녶뼧�쀥�弱쇿퀬躍멨틞佯졾퍋�녔죷艅→튂�썹����며ⅴ嶸긺퓭獒녘㎢屋녘괌蘊욇쐺櫻욅뮵蘊썲뾿畑хæ榮�돯�꿰뵟�ο�寧쇿쥌鶯삣떼佯뤷볘孃먩걬�믤띅�띷쉻�숁쎑�뽪２���욅�永�퇅營꿱깷�믦뼬蜈욤첆�앶떎容띺폖鸚뺝�躍�깭�붹솿�먩콖曆끾퐶�녕˝�녽뇣�ヤ퍢�듿뀍�꾢쵉若ｆ뎴�얏뿃歷꿰끋�곭몖�뉒뮸�х┴渶싩퉽獰②끆�녘댒�싪윭屋듣랜�면뒔�ι쪓饒�뜥掠묉쪛力꾣누歷ヨ닃�쏂ㅋ鼇�お�ら쉑�→슲餘꿰틬�얕킀�껈솣�앮텎����롥쭞若ф�㎪꺔�먩삜�잏뙥�밭썪�곭��뽬겛�θ첓�믢툟�€�域쀧쮨寧밭눗畑�껐�у삸櫻묈�弱뤷컩藥€��껅릶��∏亦쇗텋繹��잏궎�믥뵧�뤹뼄�숂쵏影좂갓榮좂뉩�ц빆�뉓㉣�띺걾�들듂�띌㉦岳쀥괵�잍텘暎잏틠玉뽬킊�잌�藥썸릫���쒒！�뉐츐�싨씭曆욆쯃沃��곲젋�뤄Ⅰ�묊쥙�뽬“�쀤엶�쀥뿽�싧엩鶯썲쳜若덂껀約�躍ζ꼤�띷뎸�덃맂�뜻빖與방츏麗닸킍轢긺눉�⑴뜽�뉒뮧��씉燁�令쀧オ暎밭텖泳х묀獰욆꽚�김뮁�싪뿪熬뽬ぐ溫먫섯�귡굛�ч뒙�백쉵�㏝슚�뽭��덆쫿遙볣쵘�붷±鸚쇿�若욘톿逆싩넖�←뮰�낁뤍藥▼푻孃ゆ걗�ф젔璵�찒餘됪뉘曆녕룭�양옱嶺띸킈�ｈ닚���닺븺屋�쳞�뉔뙙�녽┫�뚩죹瓦곈돟若뉐뇻葯⑴몷�앲씒嚥뺞떮玲믦ㅆ蜈꿜툧阿섇깾�앭뜃�욘삀濚⑵쟿�욂풅�쇿샄冶뗥い弱멨콒掠띶툊凉묉걙�썸삸�귝왍�당뙗�®ㅊ玲낁뮅�띹쫿屋�ł獄↑콝穩뷴윺野붷폀��떗濾띷츝疫쒐냴影믦쓹鈺섋뻬繇잓＞鴉멧푳岳▼뫛夜졾��쇗뼭�①눥�녕쪥榮녘뀕�ｈ럹�よ뿇�껇쮭翁ヨ풘畑김퓚鸚긷�野�굢野⒴컠恙껅쾪畑꿩런�뗧뵚��ザ餓��곻Ⅳ�숁컦雅욂퓙�믣븵夜ε낏�묊돉�썼렕�얕줂鼇앶샒�낂쨹辱됮턁�듿껙蒻썲퉬�→꽀�→쮥歷ι꼥�붼죳欲먬슘若됧껴�됪솋旅덄쑝�곲엻窈붼츪�↑촿邕뗩뼹�드꺽藥뽩볕�쀧솈�닻뾿鶯볠듉�롩뇽餓겼ㄾ�뤸샍餘껆㎣辱�럳���껃킊�쎿썣易�쥗�얗슆�꾢럡�쇗럷易꿰툓�뗩죲輿사퐣傭�툣阿잌�삣넼鸚쒏꺓�뜻ㅀ�븃�띰Ⅴ�롥선畑듸Ⅶ榮꾥떏��뮲�θ틡畑룝쉴畑몌Ⅹ鶯ㅵ춢�숁룠�섉빆�섓�璵딀ª域뗧�곭뀶�믥삆獵녕ŉ畑사풁畑쇠쪊畑썼츚���쏙�繞듿쐞孃→뼹轢곭�獵�첑腰�춾慂у꼧�뜻뒔茹띹뇛�껃젾壤�꼮鼇�獄뷴��뽨옌�쇔슫也꾣렔曆밧땔璵�냶雅덁퐰畑울�癲곩쫩癲귨쫪閭잍콨癲꾤뮫鹽뽳쫭�뉓뎲�배셀饔앾쫮繞섓쫯癲덌쫱雅�쫲�잌슝�볩쫳癲뚨뼨濚배�癲띺�녽찛�ε젳冶멨쯃若댐쫷兩띰쫸癲먩뜍�삼쫺濾썸쾱亦욘텕易볠럿轢뷂쫻�잏꽫�숋쫼�껆뇱癲붺죴簾�쫾嶺든랜癲뽫릭癲쀨죲邕잞쬁癲숋쬃�쏉쬄褥띰쬅癲앾쬇�끾텈癲잏넲癲좑─�긷렚癲�┌癲ㅶ윋癲η굨�곁맧�띈땼癲�뼸遙ι뭣�꾬├�곮몛癲⑨┤櫻뗰┴癲ュ떳壤깍━�졿쉸璵방┏麗멩납歷뜻퐗嚥싩�쏁��뀗�잏뜲癲�몳癲�뱮�덄찊瀛볩┓癲계떛屋좄퓥癲깁뜄癲꿴쐷癲놂┫阿귛�わ┻�덂룪�녔괸嚥딁뙄�욜đ��뿚�귨╋獒붻ð鈺썼괴癲룬뒽癲면쐯�먧틪鴉띴퓠�꿨뜄�얍맫�싧、罌뷴ⅶ夜쎾��잞┨�딀븭�욘솮歟㎪콢驛녕깗�х뜏嶺썼쐢沃ㅹ갛庸뉐콏亦껆뛾�됮댖繹ョ뫁�잏ł潁뺠삃��鶯끾뱚��뵓�곁퓖�뺡썚耀붹를��ぉ囹よ눆�숃씤鼇쎾찅若뚦츥歟→�役ｇ렔�볡맟閻쀧랭玲ヨ꽆�뺠렄穩뚪삷�묉쎇孃��뷸엵黎ょ럨��쮦閭ょ윯鸚뽩뎄藥띸뙠�륅┷癲삣깷�밧젽鸚�쫿冶싧�癲쇽┰蒻€떁�뽪뮄�억┥�쒙┸艅덌��욜뫀筌곭챻囹�퉯濚욆���곤쭆��쫨玉좈걲筌껈�耀믤끍轝꿩뎬潁잒ㄵ渦긴퓩��넇�뉐웻罌됧�佯멩뀆礖뺞텒疫㎪볘�붺몾�①뵮�녘뙵�됭툓�붼룥筌꾡틢鵝묈겤�ゅ룉�뗥뤂若뉐캆弱ㅶ꽊�귝뿴�쏁럸���귞쪖獵묊┨榮녺씜�뗨뿑�욆퓗�뉔꺏�ら쉫�③썿�뽩쉑��삺��뀥葉띌긽�듾틧筌끾찑餘욄풊�됭�섋듃�볣걢�뺡쎊�삭뵚遼긴틦�딃썑�껃렅�▼쐯�믣옡揶쎾쳞野껅�ⓩ꽴�닸쾮域방묾繹먪댆�욜몭�묋쥈饔낂걽筌녽솫窈섌킏�덅텏�욂퐤�됧깯�긷쐨冶붷쮤弱됪뀺�먩릎�꿰몝渶�긿�롨뫂�욤씇烏쏂쨾玉귡걬�뗩춳阿념풌�믣뀴筌뉐뵱�⒴�若ε뭡亮썲봅�졿깱�덃꼮�꾣뵺�됵쭏�붹윓筌됪ⅰ璵€껸域㏆쭒歷몌쭓嚥←뙳�뤄쭔�쒐뵳筌띸솒筌롳쭗泳�눧�멱짆沃섋쳸獄�린癰귡걡�얗겫�됮뇡��쭚筌묈젆筌믤캆�됭궟筌볩쭟�곩�弱뱄쭠筌뽪숴�㎬깶兀뉛쭢�쀩뼅筌섓쭥筌싷쭧�욘닅�쒐델�랃쭨�졿겑�뉑�沃얗��긴튃�잍략��솻�녜．�뽪끽�묈뇺�됭녂冗밥풚�싧�若쒏꼷�욘벉濾끾칲�묊윢獰⑵돞�뤺읅烏ｈぜ鈺곈넫雅뚥빳鴉딉쭩筌욃ㅇ冶⑨쭫藥꿨폑壤쎿�∽쭬筌∽㎖筌ｇ댚�οℓ�곁뿆筌η㎉筌��뚩�녘굜�↑뜎筌㏆㎤縕썼껙�뉛㎥筌ら４繞뚳㎙筌х�루썗玲딁퓣玲쇠쵘雅뷰퍊�껃뜲筌�뮵�졾㎉野끻폊恙띷문筌�㎝永よ뙲筌계슀沃랃㎟��씣筌뀐㎡訝�鵝싦슭鶯방뿥繹��면렟腰밥뻣鶯у쫲冶숁걖筌댐㏊葉뷂㎍�뤺퀍�ε뛾筌뤄㎏筌밥퍖�⒴춹�요퍝�뷴뮜冶됧㎰耶먨춻耶쒏겂�덃퍔�숂뀸�녺벜�든즯榮ヨ�낁눎�②뵕�됭ギ蘊뉔썙鵝쒎떧�쇗뼨�①겮�며댌泳썼뒐�뚪�俑꿨�汝㎪츟逆븀썮略묉슟逆쏁�怜よ졅�쒍툑餓쀥뙛�닷♤鶯��弱뉐립佯꾢섧�뚧슩�뽪쯃茹ｆ쵊轢욜뎳筌븀뜍�뗧쳽暎㎬끂�잒눉�딂뫊�ｈ뼌�뤺짔兀볣넭�룬슌�띶뱣�ⓨ��띷쓲�썸쥞歷썸퍜�썹륫獒곮깹雍됮퐢慂롧댂嶸뤺쳨�싦퐞鵝롥꽧��冶먨틫�득씡璵�쮻亦�툣�숂뙦�썹�榮듣떑�배몭�룩찛縕�틚�숅궦�롩퐶�ｅ릨椰▼칯�섉빑譯당땮筌사쉪令띸쵙映띸맘玲잒띀玉ヨ퀕壅ㅸ래癰잒역瓦백겑�묇퐙鵝뷴궠�ⓨ끂�띶돦櫻▼【也졾컝掠뺝퍤�쎿댆�볠�麗덃쓩�롧맆�곁뵺�묊솾嶺뚨츐嶸�칳瀛뤺ŧ雍얕퐠�욥뒖��맜�삯줃窈ラ쩄�뉑닼�섉탽�ㅷ쳥影�永뜹뜝略얍틭轢며궧暎섌쐭饒롩퍧�ζ뫚�뜸툈雅뺜벼�쒎겣�덂쭇若싧�佯�뻔孃곫깄�뷸붃�닸뿄�뜻쇅�얏ⅷ茹됪�黎�曆�曆ⓩ툨疫욅�욅궊�롧뤍�븀씃閻뉒쫷葉뗧㈌暎양텕�뉓쮥獄よ쿉��뀏�섌돡�뚪뙛�녽쓻�쒒쟼庸롥댍�묈빞�ㅵ툦凉잍굦�먩¿嚥잏�寧ц뇥�븃＝獄멱퉬�띺솮�쏃쑞窈뚪퐡岳롥뀊�뗥뒰�꿨폇壤ユ렕�띷뿩�곫쎓�방쐻歟앮짋礪썸폊逆�뀱�η닼�ょ쑛曄뽫쪡燁잏쯄囹뺟쿁楹잏탡濚계굟�삭슕屋붻た擁숃틒�좈겖�ｉ샍�뺡낄�뤹컜擁녜룂耶섇컟�믤떃�앭�㎩츞孃욄궛�ユ짆曆숂맢葉�탞泳쒐릴�ヨ릉甕들띃�섆퐧�먨랩佯㎪뙧營や말鵝뤶풇�싧쭩�꾢뫇�ⓨ뿾也뤷츢藥욃퍣�앮쑒�길젶力ⓩ눠疫딀풅�루룧�뉒콐榮귞눋泳�닟�쏂㉪沃낁뎔翁딂설�깁뀕�믧몖蓼먪ス暎δ퓡�곩뇛�덂�約삥솛與썸탾繹뽪연�뚨빉塋ｈ젪�↓겣�뗩㎰�곦릎餓꿱죫�띶띂輿쎿�黎곮뫚罌욄냾�얏떙�앯뵎�뉒퉺�멱춬兀덁퉳�ゅ뮟�겼�恙쀦똻�뉑뫍��뿨�뷸옗�녔�黎졿쿅轢х윥�η쪏曄쀧킍��꼥�녘뒡�룩쐶沃뚳㏈兀꾥뗀�꿰쎍葉숂㉦濚붻겥�뉐뿏櫻득뙬�€솄�뗦∼礖쎿츇域ζ볍�띸뫅�←븲�밭썳�욅엹燁�툒潁앲눤��쥥鼇븃퀝邕ヨ쒼�꿴렚�ｉ솿�뉏푶�긷㎦椰됧툢旅롧뱠�양㎥囹믦넟��나瓮뚩열�잍쐲筌썲윿逆쀧퇌雍�뤆�녶쓸�꿩푶訝붶풕�잌룊�잌뎐藥�А閭ㅷ즹嶸싷㎨癰됭퍓��뜆�양�囹꾦뙬�욥쉠�경쒸��뮜�싩쳞怜믥틓暎꿰틮溫싪큻�썽쨶耀뚦댒野잍벀��눔��룂櫻방뀡�숁눣�х쳶溫믦츝�됧�▼돲�긷㉫兩졾쉼�닸븵�뚧샄�€쭕譯꾣섣�뽫삞囹볢꽮�숃룚�쇔궢�겼�野ⓨ쉘�←젲泳듣룣�↓뇞�드냺�든춺縕у뇙倻삥궫�뺝�쒙㎰�붷갰�썸닖�볠벒�ζ퍕�좄꼯癰좈솦�삡퍨�껃뼐鸚⒴퇌�끾퀔曆븀럵令욤닗��낀甕먬겥�㏝뿠�↓웺�멨벒�녶씁�ㅶ푽泳닺폕饔띺맮�됧컰亦얏렌�쏁왊怜썹광屋배쳜�욃┥躍뽪뜼�믥뻿�ヨ쳹縕쇠폃兩녔쇀曆멱겱�곮쳦�묌캋箋��껅쎘易뺞뺏渶좄ウ��걻遙붷닜�욕벂�붹뒆�쎿⇔濾믤쪡與든굮��줉鹽곭쨴燁믥쮰�뽬돵�뺠뜆�됭쾫擁낂뀬�뗩넯岳껃썞��윐��鰲멨�恙뽪쓳�ⓨ룫櫻싧��ㅶ냱�좂맒�계뵦�껅뮢�у킈��罌쒏듊�ⓩ쨴璵멩쯂疫ョ슳燁뗨듇�⑵쳪擁②옙�믧뀑�쒒뙋�섌럻�쏃㉥欲띴툚�쒐쪤塋븀춵影됬리�꾥튃癰닺뻗�먩삦濾욜몕�뷸쑏容쒎뀉恙졿쿀�꿱줉烏룡궡�듣릡兀끻룚�밧샂夜뜹갚�딁퓼�싪꼩��땃�됮찣冗꿨겢餓꾢렆�삥릍掠ㅴ푽�ㅵ뿤約쇿튋�ζ쥟亦삥톬�양뿏�당솪葉싩찅渶뉒렌營�눜�⑵폒�됮┳慂믣뎴�낂－誤や툋�믤펵堊드��뺞쾲役며맀�㏝뇺�쇠웶燁ㅷ㉠恙ヤ퍟�ㅵ붂罌�┘�경돀�뽪쑗璵뺠댌��腰깁쭩�у뜐�꾢씪箋곫돇箋귝뱼�ユ윚嚥곫엷�®맱鼇쀩맱�묈쁿��퐟�싨춲�섊궘泳삭첈也よ꽞�®쐢�썼꺾櫻붹맠礖삣츜躍묉묻箋껇빀�뚦룿鸚ゆ�졿뀑餘녷굅力곁쵝�롨땾瓮녽궛窯깍쮧�뉑쑈�묉봽�롥릱�잒쮱�잍《箋끿뿘嶺믥뎠�싧젂礪뚩끏筽ら���밧겦也쀥━�뺡�뤻И�앯돶�뽩씉惹녶럽�딀뮡�뷸씣力€늅�х맯�당슘��퇊�쀥닩�귝씮�덄뱽縕⑵쑥�묌삫�ュ룺�뚥쉘�꾣굷�쀦쿆役욜뎹�썹쮻誤뉓쿈壤�풆�배넧�롣씩�뤸뎮�뉒칶渶①여�띺옲蟯숃껫�ゅ뭄�계릫屋뺝맆爺뽩묍兩℡펺�껇궨�썽뻾�쎽퐟�끻뙇�뤷뭷�뷴쐝躍껅�뽪뒟�길뜒箋녷끝役�뼮�꿱깯��떈�↑뮧熬띹쨸�뗩떔繇썽츗亮끾슫�앯�묊늽箋뉏영�썲쉠�볠쓶與숁펰�®ⅷ烏②국繇뉔즲要껃뱚葉잍쪚獄룩콎窯③┏壤쇗뒲�꿰슢熬ラ겳�귛뙶凉쇔퓚力뚨룎�®뼀嶺녻떮腰앬퉷�쇌툔鵝뺝렑鸚뤷퍑�경껙�뺠뜼����먬쐾欲뺝즿耶멱솏玉붼떪野믤겏�띷뿱黎쀦샨驛ｇ�싩퐬玲곈뼇�믧솏�볟돯饔꾢눦�ュ뮯�ｅ뻿茹삥떫渶섋돡�쒒쇃埇밧릦�덄썟�ㅹ뼡�붼솢雅㏘펹冶�ウ藥룡걩�쀦씘旅곫쾯歷�섯�쏂닼箋덌쮬�끺벤�뺝뮩�볟쪡耶⒴��덃Ⅷ役루�ｈ읂鰲ｈ㈁獄㏝굚蓼�じ�얏졇�뽩뭏�뤺뜃烏뚥벴�묈슢��꽀�욥쨯耀쀩쬂�볟쥮�쏂㉠�꿩ザ�삭퍛閭뉔슞要쀥쪜��壅ラ씓岳붷낫凉�눡�쎿낙�ョ럡�밭뤎�⑴쓭永껆덩潁ｈ댎烏믭쮭蘊�뎶窈�춵令닺��곩쳧岳졾뜑鸚얍낸�얏돌�배꼨�뉓렋�뤻젾雅ⓨ뀈�묈엹壤€퀌譯롧�끿걧��넂�⑴뫆�딂옠烏↓�덆궋�ｉ┬��퐮�졿뀱�녘븰癰딃넰�뗤퉶雅믣뫜鶯뺝：也썲껨凉㎪댍�덃삃�㎪�役⒵톽疫뽪뻗驛붹퓼嚥⑴걹�먪맓�싩뱺�볡쪣楹딁툧�↑뒭�ヨ뮸�롨솦�닺�穩ら렗��窈ζ깙�뽭끁惹싨삈曆룡맘�욥춡恙썸깪寧뤷뱞凉섉콪力볠눅�섊큶�배쮯辱삣뙑�뚦쵃與븀겓�든쫶獵얕뒻��㈀鈺곮꺼�댐쮮�닸뵭閻븀♤令ヤ만�싧쪖若�뭘�ｆ룢閭→솯旅볠툢�η뮥榮덆굜要⑶갈域삥퍚�얕콅�듿눖亮뚦쑬�띷꺐�경뀒�껅셿礖ζ퀋疫잍퍒逆®뀒�쒐쉯影곭갊�믦쓼�묌쉷容껃뙬�욃뻣孃딀걿�붹눟��쐝茹쒏량驛�겙�ょ묫�얕뙱�붻え蘊꾢뒅�꿨츝艅ラ릢��쉮耶앮븞�끾썖歟잍텓曆녺댗�닻뀿要띴쒸�쇿럻�롥맻�됧뾽躍욕풄�썹뀰�앶�끻떅�녑·鶯롧꼧�뤹눤�계쮶�덅뼥�㎪쉪�딂맩�됧뼑驪곩퐰孃썸룼�됬뀋獄김폓墉얌폂�븀깑��솲�ㅸ춲冗멨뀋�뜹뙂域띈꺒容묉삎轝ｇ굹�뺝릡掠밭큸鼇뽪쵟轝썸춨�멩겙域썹퓮�덂깣�욃뼔�ュ썚冶у쵇躍뚧넍�섉댇�욄썺�숂넿�븀뒮獵㎫�獰꿱ŉ";
	var KEYBOARD_CHARS = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`1234567890-=~!@#$%^&*()_+|[]{};:',./<>?\"\\";
	
	_strText = _strText.split(" ").join("");
	_strText = _strText.split("<BR>").join("");
	_strText = _strText.split("\n").join("");	
	
	for (var i = 0; i < _strText.length; i++) {
		var c = _strText.charAt(i);
		if (EUCKR_CHARS.indexOf(c) == -1
				&& KEYBOARD_CHARS.indexOf(c) == -1) {
			return c;
		}
	}
	
	return "";
}

function showChromePaymentNotice() {
	// 紐⑤컮�쇱씠嫄곕굹, �щ＼�� �꾨땲嫄곕굹, �대� 遊ㅼ쑝硫�..
	if (m_formulaCode == "M"
		|| navigator.userAgent.toLowerCase().indexOf("chrome") == -1
		|| Cookies.getCookie("NO_POP_CHROME_1_DAY") == "Y") {
		return;
	}
	
	var html = '\
		<!-- pop_chrome_dimm �щ＼ 寃곗젣�덈궡 �� �ъ슜 -->\
		<div class="pop_chrome_dimm" style="display:block"></div>\
		<!-- �щ＼ 寃곗젣�덈궡 �앹뾽 -->\
		<div class="pop_chrome">\
			<header class="pop_chrome_ttl">\
				<h4>�щ＼ 寃곗젣 �덈궡</h4>\
				<p class="pop_chrome_close">\
					<a href="javascript:void(0):">�リ린</a>\
				</p>\
			</header>\
			<section class="pop_chrome_cont">\
				<div class="scrollbar-inner">\
					<p class="chrome_title">�꾩옱 �щ＼�먯꽌 寃곗젣媛� �섏� �딅뒗 臾몄젣濡� �명빐 �ъ슜�� 遺덊렪�섏떊 遺꾨뱾猿섏꽌�� <br>�꾨옒 �덈궡瑜� �곕씪 �ㅼ젙�� 蹂�寃쏀빐二쇱떆湲� 諛붾엻�덈떎.</p>\
					<p class="chrome_stit">�щ＼ 釉뚮씪�곗� �ㅼ젙 蹂�寃� 諛⑸쾿 (42.0.2311.90 踰꾩쟾�댁긽)</p>\
					<dl class="chrome_info">\
						<dt>1.</dt>\
						<dd>釉뚮씪�곗� 二쇱냼李쎌뿉 chrome://flags/#enable-npapi �낅젰 �� �섏궗�⒱�� 踰꾪듉�� �대┃�섏뿬 <br > NPAPI瑜� �ъ슜以묒씤 �곹깭濡� 蹂�寃쏀빀�덈떎.\
						</dd>\
					</dl>\
					<p class="cp_img"><img src="/common/img/util/pop_chrome_img01.jpg" alt="�щ＼�ㅻ챸 1" /></p>\
					<dl class="chrome_info">\
						<dt>2.</dt>\
						<dd>�ъ슜 踰꾪듉�� �대┃�섍퀬 �쇱そ �섎떒�� �섑��섎뒗 吏�湲� �ㅼ떆 �쒖옉 踰꾪듉�� �대┃�섏뿬 釉뚮씪�곗�瑜� �� �쒖옉�⑸땲��.<p> (�� �섎떎�� �쒖옉�� 踰꾪듉�� �꾨Ⅴ吏� �딄퀬, �꾩쓽濡� 李쎌쓣 �レ븯�� �ㅼ떆 �ㅽ뻾�� 寃쎌슦 蹂�寃쎈맂 �ы빆�� 利됱떆 �곸슜�섏� �딆뒿�덈떎.)</p>\
						</dd>\
					</dl>\
					<p class="cp_img"><img src="/common/img/util/pop_chrome_img02.jpg" alt="�щ＼�ㅻ챸 1" /></p>\
					<p class="ch_info">�꾩쓽 諛⑹떇�� 吏꾪뻾�대룄 寃곗젣媛� �섏� �딆쑝�� 寃쎌슦�먮뒗 Internet Explorer瑜� �듯빐 寃곗젣 遺��� �쒕┰�덈떎. <br>媛먯궗�⑸땲��.</p>\
				</div>\
				<div class="todayPop_zoon">\
					<p class="btn_popu_ok"><a href="javascript:void(0):">�뺤씤</a></p>\
					<p class="todayPop_txt"><input type="checkbox" name="todayPop" id="todayPop" > <label for="todayPop">�ㅻ뒛 �섎（留� 蹂댁� �딄린</label></p>\
				</div>\
			</section>\
		</div>\
		<!-- �щ＼ 寃곗젣�덈궡 �앹뾽 end -->\
	';
	
	$("#container").prepend( $(html) );
	
	// �앹뾽 �リ린
	$(".pop_chrome_dimm , .pop_chrome_close > a , .btn_popu_ok > a").on("click", function () {
		$(".pop_chrome_dimm , .pop_chrome").fadeOut();
	});
	
	// �ㅻ뒛 �섎（留� 蹂댁� �딄린
	$("#todayPop").on("click", function () {
		var name       = "NO_POP_CHROME_1_DAY";
		var value      = "Y";
		var expiredays = 1;
		
		Cookies.setCookie(name, value, expiredays);
		
		$(".pop_chrome_dimm , .pop_chrome").fadeOut();
	});
	
	// 而ㅼ뒪�� �ㅽ겕濡ㅻ컮
	$('.scrollbar-inner').mCustomScrollbar({
		 axis     : "y"
		,advanced : {
			autoExpandHorizontalScroll : true
		}
	});
}

function getRandomNumber(_nLength) {
	if (_nLength == undefined) {
		_nLength = 4;
	}
	return String(Math.random()).substr(2, _nLength);
}

function showTextProcessing(_strSelector) {
	try {
		var strOrgText  = $(_strSelector).text();
		if (strOrgText == "") {
			strOrgText = "泥섎━以�";
		}
		var strShowText = strOrgText;
		var strUnit     = ".";
		
		$(_strSelector).html(strShowText);
		
		return setInterval(function () {
			if (strShowText.split(strUnit).length >= 10) {
				strShowText = strOrgText;
			} else {
				strShowText += strUnit;
			}
			$(_strSelector).html(strShowText);
		}, 500);	
	} catch (e) {
	}	
}

function hideTextProcessing(_objInterval) {
	clearInterval(_objInterval);
}
function getSrvTime(){
	var xmlHttp;
	if (window.XMLHttpRequest) {//遺꾧린�섏� �딆쑝硫� IE�먯꽌留� �묐룞�쒕떎.
		xmlHttp = new XMLHttpRequest(); // IE 7.0 �댁긽, �щ＼, �뚯씠�댄룺�� ��
		xmlHttp.open('HEAD',window.location.href.toString(),false);
		xmlHttp.setRequestHeader("Content-Type", "text/html");
		xmlHttp.send('');
		return new Date(xmlHttp.getResponseHeader("Date"));
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
		xmlHttp.open('HEAD',window.location.href.toString(),false);
		xmlHttp.setRequestHeader("Content-Type", "text/html");
		xmlHttp.send('');
		return new Date(xmlHttp.getResponseHeader("Date"));
	}
}