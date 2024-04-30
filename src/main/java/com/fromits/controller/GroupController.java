package com.fromits.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class GroupController {

    String dir = "group/";

    @RequestMapping("/newgroup")
    public String initial(Model model) throws Exception {
        model.addAttribute("center",dir+"newgroup");
        return "main";
    }
}
