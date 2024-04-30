package com.fromits.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/map")
public class MapController {
    String dir = "map/";
    @RequestMapping("")
    public String map(Model model) throws Exception {
        model.addAttribute("center", dir + "search");
        return "main";
    }
}
