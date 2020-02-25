package com.jun.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jun.service.MemberService;
import com.jun.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//회원가입 GET
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public void getJoin() throws Exception {
		logger.info("get join");
	}
	
	//회원가입 POST
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String postJoin(MemberVO vo) throws Exception {
		logger.info("post join");
		String inputPass = vo.getUser_pw();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setUser_pw(pwd);
		service.join(vo);
		return "redirect:/";
	}
	
	//로그인 화면
	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public void getLogin() throws Exception{
		logger.info("get login");
	}
	
	//로그인 POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		session.getAttribute("member");
		MemberVO login = service.login(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getUser_pw(), login.getUser_pw());
		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/loginView";
		}
		return "redirect:/";
	}
	
	//로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 수정 GET
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "/memberUpdateView";
	}

	//회원정보 수정 POST
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/";
	}

	//회원탈퇴 get
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "/memberDeleteView";
	}
	
	//회원탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		service.memberDelete(vo);
		session.invalidate();
		
		return "redirect:/";
	}
	
	//비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception {
		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUser_pw(), login.getUser_pw());
		return pwdChk;
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="/nickChk", method = RequestMethod.POST)
	public int nickChk(MemberVO vo) throws Exception {
		int result = service.nickChk(vo);
		return result;
	}
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailChk", method = RequestMethod.POST)
	public int emailChk(MemberVO vo) throws Exception {
		int result = service.emailChk(vo);
		return result;
	}
	
	//휴대폰 중복 체크
	@ResponseBody
	@RequestMapping(value="/phoneChk", method = RequestMethod.POST)
	public int phoneChk(MemberVO vo) throws Exception {
		int result = service.phoneChk(vo);
		return result;
	}
}
