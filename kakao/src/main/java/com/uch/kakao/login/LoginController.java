package com.uch.kakao.login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uch.kakao.login.service.KakaoAPI;

@Controller
public class LoginController {
	
	@Autowired
	private KakaoAPI kakao;

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam("code") String code, HttpSession session) {
	    String access_Token = kakao.getAccessToken(code);
	    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    kakao.getFriends(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("nickname") != null) {
	        session.setAttribute("userId", userInfo.get("nickname"));
	        session.setAttribute("access_Token", access_Token);
	        session.setAttribute("userInfo", userInfo);
	    }
	    return "index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		
		return "index";
	}
}
