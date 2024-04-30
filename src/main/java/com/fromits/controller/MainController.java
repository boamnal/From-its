package com.fromits.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model) throws Exception {
//        model.addAttribute("center","layout");
        return "main";
    }
    @RequestMapping("/initial")
    public String initial(Model model) throws Exception {
        model.addAttribute("text1","새로운 그룹을 만들래요");
        model.addAttribute("text2","이미 만든 그룹이 있어요!");
        return "index";
    }
}
