package com.fromits.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MypageController {
    String dir = "my/";

    @RequestMapping("/mypage")
    public String mypage(Model model) throws Exception {
        model.addAttribute("center",dir+"mypage");
        return "main";
    }
}
