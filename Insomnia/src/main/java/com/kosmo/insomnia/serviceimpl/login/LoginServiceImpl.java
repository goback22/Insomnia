package com.kosmo.insomnia.serviceimpl.login;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kosmo.insomnia.service.login.LoginService;
import com.kosmo.insomnia.util.login.MailHandler;
import com.kosmo.insomnia.util.login.TempKey;

@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	private JavaMailSender mailSender;

	// OneMemoDAO객체 주입
	@Resource(name = "loginServiceDAO")
	private LoginServiceDAO dao;

	@Override
	public void create(Map map) {
		dao.insertUser(map);// 회원가입 DAO
		
		String key = new TempKey().getKey(50, false);// 인증키 생성
		dao.createAuthKey(map.get("id").toString(), key);
		
		try {
			MailHandler sendMail = new MailHandler(mailSender);
		    SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy.MM.dd");
	         Date time = new Date();
	         
	         sendMail.setSubject("insomnia 회원가입 이메일 인증");
	         sendMail.setText(new StringBuffer()
	               .append("<div id=\"readFrame\">")
	               .append("<xmeta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">")
	               .append("<table width=\"550\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"margin:0 auto 30px auto;\">")
	               .append("<tbody><tr><td><img src=\"https://s3.ap-northeast-2.amazonaws.com/insomnia4/cover_Image%2Fsonyilseung%40naver.com_cover_Img.jpg\" alt=\"PAYCO\" width=\"600\" height=\"100\" border=\"0\"></td></tr>")
	               .append("</tbody></table>")
	               .append("<table width=\"550\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"margin:0 auto 0 auto;font-family:'돋움',Dotum,AppleGothic,sans-serif;font-size:12px;\">")
	               .append("<tbody><tr><td>")
	               .append("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">")
	               .append("<tbody><tr><td align=\"left\" valign=\"top\" style=\"padding:0 23px 20px 15px;color:#383838;font-size:20px;font-weight:bold;letter-spacing:-1px\">INSOMNIA 회원가입이 완료되었습니다.</td></tr>")
	               .append("<tr></tr><tr><td align=\"left\" valign=\"top\" style=\"padding:0 23px 0 20px;color:#8e8e8e;line-height:18px;font-size:12px\">")
	               .append(map.get("id"))
	               .append(" 회원님,\r\n" + 
	                     "   </td></tr><tr><td align=\"left\" valign=\"top\" style=\"font-size:12px;color:#3d3d3d;padding:10px 23px 30px 20px;line-height:18px\">")
	               .append("<strong>아래 인증 링크를 클릭하시면<br>이메일 인증이 완료됩니다.</strong>")
	               .append("   </td></tr>")
	               .append("<tr><td align=\"left\" valign=\"top\" style=\"background-color:#fafafa;padding:30px 0 30px 25px ;border-top:1px solid #e8ecf2;border-bottom:1px solid #e8ecf2\">")
	               .append("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"table-layout:fixed;font-size:11px\">")
	               .append("<tbody><tr><th align=\"left\" colspan=\"1\" rowspan=\"1\" scope=\"row\" width=\"76\" style=\"color:#666;letter-spacing:-1px\">가입일 </th><td style=\"padding-left:20px;font-weight:bold\">"
	                     + format1.format(time).toString()
	                     + "</td></tr>")
	               .append("<tr><th align=\"left\" colspan=\"1\" rowspan=\"1\" scope=\"row\" style=\"color:#666;letter-spacing:-1px;padding-top:17px\">인증 링크</th><td style=\"padding:16px 0 0 20px;color:#383838\">")
	               .append("<a href=\"http://localhost:8080/insomnia/emailConfirm.ins?user_email="
	                     + map.get("id").toString()
	                     + "&key="
	                     + key
	                     + "\" target=\"_blank\" style=\"color:#fc1a24;font-weight:bold;text-decoration:underline;padding-bottom:1px;\" rel=\"noreferrer noopener\">여기를 클릭해주세요.</a>")
	               .append("</td></tr>")
	               .append("</tbody></table>")
	               .append("</td></tr>")
	               .append("</tbody></table>")
	               .append("</td></tr>")
	               .append("</tbody></table>")
	               .append("<table width=\"550\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"margin:0 auto 0px;\">")
	               .append("<tbody><tr><td style=\"padding:20px 14px 0px;line-height:18px;font-size:12px; font-family:dotum; color:#999\">")
	               .append("   이 메일은 발신전용으로 회신이 되지 않습니다.<br>")
	               .append("더 궁금하신 사항은 <strong><a href=\"#\" style=\" color:#acacac;text-decoration:underline;\" rel=\"noreferrer noopener\" target=\"_blank\">고객센터 (wndrhtkfurh@naver.com)</a></strong>로 문의해주시기 바랍니다.")
	               .append("</td></tr>")
	               .append("</tbody></table>")
	               .append("<table width=\"550\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"margin:30px auto 0 auto\">")
	               .append("<tbody><tr><td style=\"font-family:'Tahoma';font-size:12px;color:#b3b3b3;padding:0 0 30px 15px;border-bottom:solid 1px #e6e6e6\">Ⓒ INSOMNIA. </td></tr>")
	               .append("</tbody></table>")
	               .append("<table style=\"display:none\"><tbody><tr><td><img src=\"http://owl2.nm.naver.com/received/MTsxNDQ1MjE3MjY0Mjg3LjE5ODA4LjQ2MjQ1Mzc2QGN2cGxvd2wyMS5ubTtiZV9kYXNhbkBuYXZlci5jb20=.gif\" width=\"0\" height=\"0\" border=\"0\"></td></tr></tbody></table>")
	               .append("</xmeta></div>").toString());
	         sendMail.setFrom("insmonia@insumnia.com", "인섬니아 관리자");
	         sendMail.setTo(map.get("id").toString());
	         sendMail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void createAuthKey(String user_emial, String user_authcode) {
	}


	@Override
	public void userAuth(Map map) {
		dao.userAuth(map);
	}


	@Override
	public boolean checkSignup(String id) {
		
		return false;
	}

	@Override
	public void insertUser(Map map) {
		// TODO Auto-generated method stub
		
	}

}
