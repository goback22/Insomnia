$(document).ready(function () {

  /* gnb */
  var gnb =
    '		<ul>' +
    '			<!-- COFFEE -->' +
    '			<li class="gnb_nav01">' +
    '				<h2><a href="/coffee/index.do">COFFEE</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/product_list.do">而ㅽ뵾</a></li>' +
    '								<li><a href="/coffee/product_list.do">�ㅽ�踰낆뒪 �먮몢</a></li>' +
    '								<li><a href="/coffee/product_list.do?PACKAGE=01">�ㅽ�踰낆뒪 鍮꾩븘</a></li>' +
    '								<li><a href="/coffee/product_list.do?PACKAGE=02">�ㅽ�踰낆뒪 �ㅻ━媛�誘�</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/productFinder.do">�섏� �댁슱由щ뒗 而ㅽ뵾</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/reserve_info.do">�ㅽ�踰낆뒪 由ъ�釉뚢꽓</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/espresso.do">�먯뒪�꾨젅�� �뚮즺</a></li>' +
    '								<li><a href="/coffee/doppio.do">�꾪뵾��</a></li>' +
    '								<li><a href="/coffee/espresso_macchiato.do">�먯뒪�꾨젅�� 留덊궎�꾨삉</a></li>' +
    '								<li><a href="/coffee/americano.do">�꾨찓由ъ뭅��</a></li>' +
    '								<li><a href="/coffee/caramel_macchato.do">留덊궎�꾨삉</a></li>' +
    '								<li><a href="/coffee/cappuccino.do">移댄뫖移섎끂</a></li>' +
    '								<li><a href="/coffee/latte.do">�쇰뼹</a></li>' +
    '								<li><a href="/coffee/mocha.do">紐⑥뭅</a></li>' +
    '								<li><a href="/coffee/flat_white.do">由ъ뒪�몃젅�� 鍮꾩븞肄�</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/higher_enjoy.do">理쒖긽�� 而ㅽ뵾瑜� 利먭린�� 踰�</a></li>' +
    '								<li><a href="/coffee/higher_enjoy.do">而ㅽ뵾 �꾨젅��</a></li>' +
    '								<li><a href="/coffee/higher_enjoy.do?PACKAGE=01">�몄뼱 �ㅻ쾭</a></li>' +
    '								<li><a href="/coffee/higher_enjoy.do?PACKAGE=02">�꾩씠�� �몄뼱 �ㅻ쾭</a></li>' +
    '								<li><a href="/coffee/higher_enjoy.do?PACKAGE=03">而ㅽ뵾 硫붿씠而�</a></li>' +
    '								<li><a href="/coffee/higher_enjoy.do?PACKAGE=04">由ъ�釉뚮� 留ㅼ옣�먯꽌 �ㅼ뼇�섍쾶 利먭린�� 踰�</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/coffee/story.do">而ㅽ뵾 �댁빞湲�</a></li>' +
    '								<li><a href="/coffee/story.do">�ㅽ�踰낆뒪 濡쒖뒪�� �ㅽ뙥�몃읆</a></li>' +
    //'								<li><a href="/coffee/story.do?PACKAGE=01">�먯뒪�꾨젅�� 珥덉씠��</a></li>' +
    '								<li><a href="/coffee/story.do?PACKAGE=02">理쒖긽�� �꾨씪鍮꾩뭅 �먮몢</a></li>' +
    '								<li><a href="/coffee/story.do?PACKAGE=03">�� �붿쓽 而ㅽ뵾媛� �꾩꽦�섍린源뚯�</a></li>' +
    '								<li><a href="/coffee/story.do?PACKAGE=04">�대줈踰꽷� 而ㅽ뵾 異붿텧 �쒖뒪��</a></li>' +
    '								<li><a href="/coffee/story.do?PACKAGE=05">�ㅽ�踰낆뒪 �붿뭅�섏씤</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/coffee/productFinder.do">�섏� �댁슱由щ뒗 而ㅽ뵾 李얘린</a></h3>' +
    '								<p class="gnb_sub_ex_txt">�ㅽ�踰낆뒪媛� �щ윭遺꾩뿉寃� �댁슱由щ뒗 而ㅽ뵾瑜� 李얠븘�쒕┰�덈떎.</p>' +
    '								<h3><a href="/coffee/higher_enjoy.do">理쒖긽�� 而ㅽ뵾瑜� 利먭린�� 踰�</a></h3>' +
    '								<p class="gnb_sub_ex_txt">�щ윭媛�吏� 諛⑸쾿�� �듯빐 �ㅼ뼇�� �띾��� 而ㅽ뵾瑜� 利먭꺼蹂댁꽭��.</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '			<!-- COFFEE end -->' +
    '			<!-- MENU -->' +
    '			<li class="gnb_nav02">' +
    '				<h2><a href="/menu/index.do">MENU</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/menu/drink_list.do">�뚮즺</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_cold_brew">肄쒕뱶 釉뚮（</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_brood">釉뚮（�� 而ㅽ뵾</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_espresso">�먯뒪�꾨젅��</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_frappuccino">�꾨씪�몄튂��</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_blended">釉붾젋�붾뱶 �뚮즺</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_fizzo">�ㅽ�踰낆뒪 �쇱���</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_tea">��(�곕컮��)</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_etc">湲고� �쒖“ �뚮즺</a></li>' +
    '								<li><a href="/menu/drink_list.do?CATE_CD=product_juice">�ㅽ�踰낆뒪 二쇱뒪(蹂묒쓬猷�)</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/menu/food_list.do">�몃뱶</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_bakery">踰좎씠而ㅻ━</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_cake">耳��댄겕</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_sandwich">�뚮뱶�꾩튂 & �먮윭��</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_wram_food">�곕쑜�� �몃뱶</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_fruit_yogurt">怨쇱씪 & �붽굅��</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_snack">�ㅻ궢 & 誘몃땲 �붿���</a></li>' +
    '								<li><a href="/menu/food_list.do?CATE_CD=product_icecream">�꾩씠�ㅽ겕由�</a></li>' +
    //'								<li><a href="/menu/food_list.do?CATE_CD=product_etc">湲고� �몃뱶</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/menu/product_list.do">�곹뭹</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_mug">癒멸렇</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_glass">湲��쇱뒪</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_plastic">�뚮씪�ㅽ떛 ��釉붾윭</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_stainless">�ㅽ뀒�몃━�� ��釉붾윭</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_vacuum">蹂댁삩蹂�</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_accessories">�≪꽭�쒕━</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_coffee">而ㅽ뵾 �⑺뭹</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_teaPackage">�⑦궎吏� ��(�곕컮��)</a></li>' +
    '								<li><a href="/menu/product_list.do?CATE_CD=product_planner">�ㅽ�踰낆뒪 �뚮옒��</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/menu/card_list.do">移대뱶</a></li>' +
    '								<li><a href="/menu/card_list.do?CATE_CD=product_offline">�ㅻЪ移대뱶</a></li>' +
    '								<li><a href="/menu/card_list.do?CATE_CD=product_egift">e-Gift 移대뱶</a></li>' +
    '							</ul>' +
    //'							<ul>' +
    //'								<li class="gnb_sub_ttl"><a href="/wholecake/reserve_cake01.do">�⑤씪�� 耳��� �덉빟</a></li>' +
    //'							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a>硫붾돱 �댁빞湲�</a></li>' +
    '								<li><a href="/store/store_nitro_coldbrew.do">�섏씠�몃줈 肄쒕뱶釉뚮（</a></li>' +
    '								<li><a href="/store/store_coldbrew.do">肄쒕뱶 釉뚮（</a></li>' +
    '								<li><a href="/menuStory/teavana.do">�ㅽ�踰낆뒪 �곕컮��</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/store/store_nitro_coldbrew.do">�섏씠�몃줈 肄쒕뱶 釉뚮（ <img alt="" src="//image.istarbucks.co.kr/common/img/common/icon_gnb_new.png"></a></h3>' +
    '								<p class="gnb_sub_ex_txt">�섏씠�몃줈 而ㅽ뵾 �뺥넻�� 臾쇨껐移섎벏 �섎윭�대━�� 罹먯뒪耳��대뵫怨� 遺��쒕윭�� �щ┝�� 寃쏀뿕�섏꽭��. </p>' +
    //'								<h3><a href="/wholecake/reserve_cake01.do">�ㅽ�踰낆뒪 耳��� �⑤씪�� �덉빟</a></h3>' +
    //'								<p class="gnb_sub_ex_txt">湲곕뀗�섍퀬 �띠� ��. �ㅽ�踰낆뒪 耳��듭씠 �� �밸퀎�� �섎（瑜� 留뚮뱾�� �쒕┰�덈떎.</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '			<!-- MENU end -->' +
    '			<li class="gnb_nav03">' +
    '				<h2><a href="/store/index.do">STORE</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/store/store_map.do">留ㅼ옣 李얘린</a></li>' +
    '								<li><a href="/store/store_map.do?disp=quick">�� 寃���</a></li>' +
    '								<li><a href="/store/store_map.do?disp=locale">吏��� 寃���</a></li>' +
    '								<li><a href="/store/store_map.do?disp=my">My 留ㅼ옣</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/store/store_drive.do">�쒕씪�대툕 �ㅻ（ 留ㅼ옣</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/store/store_reserve.do">�ㅽ�踰낆뒪 由ъ�釉뚢꽓 留ㅼ옣</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/store/store_community.do">而ㅻ��덊떚 �ㅽ넗�� 留ㅼ옣</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/store/store_food.do">�꾨━誘몄뼱 �몃뱶 �쒕퉬�� �ㅽ넗��</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a>留ㅼ옣 �댁빞湲�</a></li>' +
    '								<li><a href="/store/store_cheongdam.do">泥�떞�ㅽ�</a></li>' +
    '								<li><a href="/store/store_star_field.do">�곕컮�� �몄뒪�뚯씠�대뱶 留ㅼ옣</a></li>' +
    '								<li><a href="/store/store_park.do">�뚮��먰뙆��</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/store/store_map.do">留ㅼ옣李얘린</a></h3>' +
    '								<p class="gnb_sub_ex_txt">蹂대떎 鍮좊Ⅴ寃� 留ㅼ옣�� 李얠븘蹂댁꽭��.</p>' +
    '								<h3><a href="/whats_new/newsView.do?cate=&seq=3121">�붿쥌濡쒖젏 <img alt="" src="//image.istarbucks.co.kr/common/img/common/icon_gnb_new.png"></a></h3>' +
    '								<p class="gnb_sub_ex_txt">�꾩슜 �몃뱶�� �곕컮�� ��, 理쒓퀬�� 由ъ�釉� 而ㅽ뵾瑜� 留뚮굹蹂댁꽭��.</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '			<li class="gnb_nav04">' +
    '				<h2><a href="/responsibility/index.do">RESPONSIBILITY</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/responsibility/starbucks_shared_planet.do">�ы쉶 怨듯뿄 罹좏럹�� �뚭컻</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/responsibility/hope_delivery.do">吏��� �ы쉶 李몄뿬 �쒕룞</a></li>' +
    '								<li><a href="/responsibility/hope_delivery.do">�щ쭩諛곕떖 罹좏럹��</a></li>' +
    '								<li><a href="/responsibility/talent_donation.do">�щ뒫湲곕� 移댄럹 �뚯떇</a></li>' +
    '								<li><a href="/responsibility/community_store.do">而ㅻ��덊떚 �ㅽ넗��</a></li>' +
    '								<li><a href="/responsibility/youth_resource.do">泥�뀈�몄옱 �묒꽦</a></li>' +
    '								<li><a href="/responsibility/our_agriculture.do">�곕━ �띿궛臾� �щ옉 罹좏럹��</a></li>' +
    '								<li><a href="/responsibility/our_culture_defend.do">�곕━ 臾명솕 吏��ㅺ린</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/responsibility/environment.do">�섍꼍蹂댄샇 �쒕룞</a></li>' +
    '								<li><a href="/responsibility/environment.do">�섍꼍 諛쒖옄援� 以꾩씠湲�</a></li>' +
    '								<li><a href="/responsibility/no_disposable_cup.do">�쇳쉶�� 而� �녿뒗 留ㅼ옣</a></li>' +
    '								<li><a href="/responsibility/bean_recycling.do">而ㅽ뵾 �먮몢 �ы솢��</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/responsibility/ethically_sourcing.do">�ㅻ━ 援щℓ</a></li>' +
    '								<li><a href="/responsibility/ethically_sourcing.do">�ㅻ━�� �먮몢 援щℓ</a></li>' +
    '								<li><a href="/responsibility/fair_trade.do">怨듭젙臾댁뿭 �몄쬆</a></li>' +
    '								<li><a href="/responsibility/farmer_support.do">而ㅽ뵾 �띻� 吏��� �쒕룞</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/responsibility/sp_ethical_management.do">湲�濡쒕쾶 �ы쉶 怨듯뿄</a></li>' +
    '								<li><a href="/responsibility/sp_ethical_management.do">�ㅻ━寃쎌쁺 蹂닿퀬��</a></li>' +
    '								<li><a href="/responsibility/starbucks_foundation.do">�ㅽ�踰낆뒪 �щ떒</a></li>' +
    '								<li><a href="/responsibility/sp_global_month.do">吏�援ъ큿 遊됱궗�� ��</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/responsibility/bean_recycling.do">而ㅽ뵾�먮몢 �ы솢��</a></h3>' +
    '								<p class="gnb_sub_ex_txt">�ㅽ�踰낆뒪 而ㅽ뵾 �먮몢瑜� �ы솢�⑺빐 蹂댁꽭��.</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '			<li class="gnb_nav05">' +
    '				<h2><a href="/msr/index.do">MY STARBUCKS REWARDS</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/msr/msreward/about.do">留덉씠 �ㅽ�踰낆뒪 由ъ썙��</a></li>' +
    '								<li><a href="/msr/msreward/about.do">留덉씠 �ㅽ�踰낆뒪 由ъ썙�� �뚭컻</a></li>' +
    '								<li><a href="/msr/msreward/level_benefit.do">�깃툒 諛� �쒗깮</a></li>' +
    '								<li><a href="/msr/msreward/star.do">�ㅽ�踰낆뒪 蹂�</a></li>' +
    '								<li><a href="/community/faq.do?menu_cd=STB2703&cate=F17">�먯＜�섎뒗 吏덈Ц</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/msr/scard/about.do">�ㅽ�踰낆뒪 移대뱶</a></li>' +
    '								<li><a href="/msr/scard/about.do">�ㅽ�踰낆뒪 移대뱶 �뚭컻</a></li>' +
    '								<li><a href="/msr/scard/scard_gallery.do">�ㅽ�踰낆뒪 移대뱶 媛ㅻ윭由�</a></li>' +
    '								<li><a href="/msr/scard/register_inquiry.do">�깅줉 諛� 議고쉶</a></li>' +
    '								<li><a href="/msr/scard/charge_information.do">異⑹쟾 諛� �댁슜�덈궡</a></li>' +
    '								<li><a href="/msr/scard/lost_report.do">遺꾩떎�좉퀬/�섎텋�좎껌</a></li>' +
    '								<li><a href="/community/faq.do?menu_cd=STB2703&cate=F05">�먯＜�섎뒗 吏덈Ц</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/msr/sceGift/egift_information.do">�ㅽ�踰낆뒪 e-Gift Card</a></li>' +
    '								<li><a href="/msr/sceGift/egift_information.do">�ㅽ�踰낆뒪 e-Gift Card �뚭컻</a></li>' +
    '								<li><a href="/msr/sceGift/msr_useguide.do">�댁슜�덈궡</a></li>' +
    '								<li><a href="/msr/sceGift/gift_step1.do" required="login">�좊Ъ�섍린</a></li>' +
    '								<li><a href="/community/faq.do?menu_cd=STB2703&cate=F22">�먯＜�섎뒗 吏덈Ц</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/msr/scard/register_inquiry.do">�ㅽ�踰낆뒪 移대뱶 �깅줉�섍린</a></h3>' +
    '								<p class="gnb_sub_ex_txt">移대뱶 �깅줉 �� 由ъ썙�� �쒕퉬�ㅻ� �꾨━怨� �ъ슜�댁뿭�� 議고쉶�대낫�몄슂.</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '			<li class="gnb_nav06">' +
    '				<h2><a href="/whats_new/index.do">WHAT&#39;S NEW</a></h2>' +
    '				<div class="gnb_sub_wrap">' +
    '					<div class="gnb_sub">' +
    '						<div class="gnb_sub_inner">' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/whats_new/campaign_list.do">�꾨줈紐⑥뀡&�대깽��</a></li>' +
    '								<li><a href="/whats_new/campaign_list.do">�꾩껜</a></li>' +
    '								<li><a href="/whats_new/campaign_list.do?menu_cd=STB2812">�ㅽ�踰낆뒪 移대뱶</a></li>' +
    '								<li><a href="/whats_new/campaign_list.do?menu_cd=STB2813">留덉씠 �ㅽ�踰낆뒪 由ъ썙��</a></li>' +
    '								<li><a href="/whats_new/campaign_list.do?menu_cd=STB2814">�⑤씪��</a></li>' +
    '								<li><a href="/whats_new/2019planner.do">2019 �ㅽ�踰낆뒪 �뚮옒��</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/whats_new/news_list.do">�덉냼��</a></li>' +
    '								<li><a href="/whats_new/news_list.do">�꾩껜</a></li>' +
    '								<li><a href="/whats_new/news_list.do?cate=N01">�곹뭹 異쒖떆</a></li>' +
    '								<li><a href="/whats_new/news_list.do?cate=N02">�ㅽ�踰낆뒪�� 臾명솕</a></li>' +
    '								<li><a href="/whats_new/news_list.do?cate=N03">�ㅽ�踰낆뒪 �ы쉶怨듯뿄</a></li>' +
    '								<li><a href="/whats_new/news_list.do?cate=N04">�ㅽ�踰낆뒪 移대뱶異쒖떆</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/whats_new/store_event_list.do">留ㅼ옣蹂� �대깽��</a></li>' +
    '								<li><a href="/whats_new/store_event_list.do">�쇰컲 留ㅼ옣</a></li>' +
    '								<li><a href="/whats_new/store_event_list.do?search_date=1&tab=1">�좉퇋 留ㅼ옣</a></li>' +
    '							</ul>';
// 20180824 �꾨━���� SEQ罹먯떛 �댁뒋 ���� by smno
if (!(typeof eFrequencyYn === 'undefined') && eFrequencyYn == 'Y') {
    gnb +=
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/eFreq/guide.do?promoSeq='+eFrequencySeq+'">e-�꾨━����</a></li>' +
    '								<li><a href="/eFreq/guide.do?promoSeq='+eFrequencySeq+'">�댁슜�덈궡</a></li>' +
    '								<li><a href="/eFreq/status.do?promoSeq='+eFrequencySeq+'" required="login">�댁슜�꾪솴</a></li>' +
    '							</ul>';
}
    gnb +=
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/whats_new/notice_list.do">怨듭��ы빆</a></li>' +
    '							</ul>' +
    '							<ul>' +
    '								<li class="gnb_sub_ttl"><a href="/whats_new/wallpaper.do">�뷀럹�댄띁</a></li>' +
    '							</ul>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg -->' +
    '					<div class="gnb_sub_txbg">' +
    '						<div class="gnb_sub_tx_inner">' +
    '							<div class="gnb_sub_tx_left">' +
    '								<h3><a href="/whats_new/store_event_list.do">留ㅼ옣蹂� �대깽��</a></h3>' +
    '								<p class="gnb_sub_ex_txt">�ㅽ�踰낆뒪�� 留ㅼ옣 �대깽�� �뺣낫瑜� �뺤씤 �섏떎 �� �덉뒿�덈떎.</p>' +
    '								<h3><a href="/whats_new/wallpaper.do">�뷀럹�댄띁</a></h3>' +
    '								<p class="gnb_sub_ex_txt">留ㅼ썡 �낅뜲�댄듃�섎뒗 �뷀럹�댄띁(PC/Mobile)濡� �ㅽ�踰낆뒪瑜� �붿슧 媛�源앷쾶 利먭꺼蹂댁꽭��!</p>' +
    '							</div>' +
    '							<div class="gnb_sub_tx_right">' +
    '							</div>' +
    '						</div>' +
    '					</div>' +
    '					<!-- �띿뒪爾� bg end -->' +
    '				</div>' +
    '			</li>' +
    '		</ul>';

  $('.gnb_nav_inner, .sdown_gnb_nav_inner, .sub_gnb_nav_inner').append(function () {
    $(this).html(gnb);
    setTimeout(function () {
      var optionMenu = {
        'MENU_CD': "STB3110"
      };
		    //__ajaxCall('/banner/getBannerList.do', optionMenu , true, "JSON", "POST", 
		    __ajaxCall('/app/coffee/getBannerList_STB3110.do', optionMenu , true, "JSON", "POST", 
		    function(data) {
		        if(data.list.length > 0) {
		        	
		            $.each( data.list, function(x, y) {
		                tmpStr = "";
		                m_tmpStr = "";
		                tmpTarget = "";
		                m_tmpTarget = "";
		                tmpRequired = "";

		                
				        tmpStr += '<div class="gnb_sub_right_bnr">';

              if (y.links != "") {
                if (y.banner_TARGET == "Y") {
                  tmpTarget = "target='_blank'";
                }
                if (y.cate_CD == "STB3115") {
                  tmpRequired = 'required="login"';
                }
                tmpStr += '<a href="' + y.links + '" ' + tmpTarget + ' ' + tmpRequired + ' title="'+y.title+'">';
              }

              tmpStr += '		<div class="gnb_sub_right_bnr_img"><img alt="" src="' + y.img_UPLOAD_PATH.replace("http://www", "//image") + '/upload/banner/' + y.img_NM + '"></div>';
              tmpStr += '		<div class="gnb_sub_right_bnr_txt">';
              tmpStr += '			<h3>' + y.title + '</h3>';
              tmpStr += '			<p>' + stringToHtml(y.description) + '</p>';
              tmpStr += '		</div>';

              if (y.links != "") {
                tmpStr += '</a>';
              }

              tmpStr += '</div>';

              if (y.cate_CD == "STB3111") {
                $('.gnb_sub_tx_right').eq(0).append(tmpStr);
              } else if (y.cate_CD == "STB3112") {
                $('.gnb_sub_tx_right').eq(1).append(tmpStr);
              } else if (y.cate_CD == "STB3113") {
                $('.gnb_sub_tx_right').eq(2).append(tmpStr);
              } else if (y.cate_CD == "STB3114") {
                $('.gnb_sub_tx_right').eq(3).append(tmpStr);
              } else if (y.cate_CD == "STB3115") {
                $('.gnb_sub_tx_right').eq(4).append(tmpStr);
              } else if (y.cate_CD == "STB3116") {
                $('.gnb_sub_tx_right').eq(5).append(tmpStr);
              }
            });
          }
          // �묎렐��_20171106 dom access 瑜� �꾪븳 �꾩튂 �대룞
          $('.gnb_sub_right_bnr > a').bind('focusout',function () {
            $('.sub_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
            $('.gnb_sub_wrap').slideUp();
          });
          // �묎렐��_20171106 dom access 瑜� �꾪븳 �꾩튂 �대룞 end
        },
        function () {
        });
    }, 500);
  });
  var btnSearch = '<label for="totalSearch" class="a11y">�듯빀寃���</label><input id="totalSearch" placeholder="�듯빀寃���" type="text">';  // �묎렐��_20171106
  var searchInput = false;

  $('.sub_gnb_wrap_inner .btn_search').append(btnSearch);
  $('.sub_gnb_wrap_inner .btn_search a').click(function () {
    if (searchInput == false) {
      $('.sub_gnb_wrap_inner .btn_search input').fadeIn();
      searchInput = true;
    } else {
      //$('.btn_search input').fadeOut();
      searchInput = false;
    }
  });

  $("#totalSearch").unbind("keydown").keydown(function (e) {
    if (e.keyCode == 13) {
      e.preventDefault();
      if (pattern_check("#totalSearch", "寃��됱뼱瑜�  �낅젰�섏꽭��.", "�덉슜�섏� �딆� 臾몄옄�낅땲��.", getPattern('BASIC3')) == false) { return; }
      var search_word = encodeURI(encodeURIComponent($("#totalSearch").val()));
      location.href = "/search/search.do?search=" + search_word;
    }
  });



  $('.gnb_nav_inner > ul > li > h2 > a').bind('mouseover focus', function (e) {
    $('.gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').hide();

    $(this).addClass('on');
    $(this).parent().next().stop(true, true).slideDown();

    e.preventDefault();
  });

  $('.gnb_nav_inner').bind('mouseleave', function () {
    $('.gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').slideUp();
  });

  $('.sdown_gnb_nav_inner > ul > li > h2 > a').bind('mouseover focus', function (e) {
    $('.sdown_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').hide();

    $(this).addClass('on');
    $(this).parent().next().stop(true, true).slideDown();

    e.preventDefault();
  });

  $('.sdown_gnb_nav_inner').bind('mouseleave', function () {
    $('.sdown_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').slideUp();
  });

  $('.sub_gnb_nav_inner > ul > li > h2 > a').bind('mouseover focus', function (e) {
    $('.sub_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').hide();

    $(this).addClass('on');
    $(this).parent().next().stop(true, true).slideDown();

    e.preventDefault();
  });

  $('.sub_gnb_nav_inner').bind('mouseleave', function () {
    $('.sub_gnb_nav_inner > ul > li > h2 > a').removeClass('on');
    $('.gnb_sub_wrap').slideUp();
  });

  if (myWindow > 1100) {
    $('.gnb_sub_inner ul:nth-of-type(6)').css({ 'padding-top': '30px' });
    $('.gnb_sub_inner ul:nth-of-type(7)').css({ 'padding-top': '30px' });
    $('.gnb_sub_inner ul:nth-of-type(8)').css({ 'padding-top': '30px' });
  } else if (myWindow <= 1100 && myWindow > 960) {
    $('.gnb_sub_inner ul:nth-of-type(5)').css({ 'padding-top': '30px' });
    $('.gnb_sub_inner ul:nth-of-type(6)').css({ 'padding-top': '30px' });
    $('.gnb_sub_inner ul:nth-of-type(7)').css({ 'padding-top': '30px' });
    $('.gnb_sub_inner ul:nth-of-type(8)').css({ 'padding-top': '30px' });
  }

  if (myWindow > 1100) {
    $('.gnb_sub_inner ul:nth-of-type(6)').css({ 'clear': 'both' });
  } else {
    $('.gnb_sub_inner ul:nth-of-type(5)').css({ 'clear': 'both' });
  }
  /* gnb end */

});