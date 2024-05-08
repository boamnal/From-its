package com.fromits.controller;

import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.MapService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class VoteController {
    final MapService mapService;
    String dir = "vote/";

    @RequestMapping("/vote")
    public String vote(Model model, @RequestParam("id") int devoteId) throws Exception {
        List<devoteCandidateDto> list = mapService.selectByDevote(devoteId);
        model.addAttribute("list", list);
        model.addAttribute("devoteId", devoteId);
        model.addAttribute("center",dir+"vote");
        return "main";
    }



}
