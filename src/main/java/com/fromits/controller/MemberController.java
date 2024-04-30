package com.fromits.controller;

import com.fromits.app.dto.CustDto;
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
//    CustDto custDto = custService.get(id);
//    // db에 없는 값이면(아이디 중복 x)
//    if (custDto == null) {
//      result = "1";
//    }

    return result;
  }



}

