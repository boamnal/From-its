package com.fromits.controller;

import com.fromits.app.dto.devoteCandidateDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping("/addcandidate")
    public Object candidate(devoteCandidateDto dto){
        System.out.println(dto.toString());
        return dto;
    }
}
