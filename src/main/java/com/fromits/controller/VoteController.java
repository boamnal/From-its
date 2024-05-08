package com.fromits.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class VoteController {
    String dir = "vote/";

    @RequestMapping("/vote")
    public String vote(Model model) throws Exception {
        model.addAttribute("center",dir+"vote");
        return "main";
    }


}
