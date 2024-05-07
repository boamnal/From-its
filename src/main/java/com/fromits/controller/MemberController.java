package com.fromits.controller;

import com.fromits.app.dto.CustDto;
import com.fromits.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
  String dir = "member/";
  final CustService custService;

  @RequestMapping("/join")
  public String join(Model m) throws Exception {
//    m.addAttribute("center", dir + "join");
    return "member/join";
  }

  // 아이디 중복 확인
  // 비밀번호 유효성 확인
  @ResponseBody
  @RequestMapping("/checkid")
  public Object registerCheckId(@RequestParam("id") String id) throws Exception {
    String result = "0";
    CustDto custDto = custService.get(id);
    // db에 없는 값이면(아이디 중복 x)
    if (custDto == null) {
      result = "1";
    }

    return result;
  }

  // 회원가입 버튼
  @RequestMapping("/addimpl")
  public String addimpl(CustDto custDto, HttpSession httpSession) throws Exception {
    custService.add(custDto);
    // 세션에 id 값 저장
    httpSession.setAttribute("user_id", custDto.getUserId());

    return "redirect:/member/login";
  }

  // 로그인 로직
  @RequestMapping("/login")
  public String login(Model m) throws Exception {
    return "member/login";
  }

  @RequestMapping("/loginimpl")
  @ResponseBody
  public String loginimpl(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) {
    try {
      CustDto custDto = custService.get(id);

      if (!custDto.getPassword().equals(pwd)) {
        log.info("비밀번호가 틀렸어요!!!!!!!!!!!");
        throw new Exception();
      }
      log.info("@@@@@@@@@@@@@@@@@로그인 성공@@@@@@@@@@@@@@");
      //  세션에 id, user 정보 저장
      httpSession.setAttribute("user_id", custDto.getUserId());
      httpSession.setAttribute("user", custDto);
      return "success";
    } catch (Exception e) {
      return "비밀번호가 다릅니다.";
    }
  }


}

