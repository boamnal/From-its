package com.fromits.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model, HttpSession session) throws Exception {
        String s = (String) session.getAttribute("user_id");
        model.addAttribute("text1","로그인");
        model.addAttribute("text2","회원가입");
        return "center";
    }
    @RequestMapping("/initial")
    public String initial(Model model) throws Exception {
        model.addAttribute("text1","새로운 그룹을 만들래요");
        model.addAttribute("text2","이미 만든 그룹이 있어요!");
        model.addAttribute("center","index");
        return "main";
    }
    // 로그아웃
    @RequestMapping("/logoutimple")
    public String logoutimple(Model model, HttpSession httpSession) {
        log.info("로그아웃하면 로그가 찍혀요~");
        httpSession.invalidate(); // 로그아웃하면 서버에서 세션 정보 삭제
        log.info("로그아웃이 끝났어요~~");
        return "redirect:/";

    }
}
