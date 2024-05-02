package com.fromits.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class PromiseController {
    String dir = "promise/";

    @RequestMapping("/newpromise")
    public String newPromise(Model model) throws Exception {
        model.addAttribute("center",dir+"newpromise");
        return "main";
    }
}
