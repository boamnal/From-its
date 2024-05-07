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
@Slf4j
@RequiredArgsConstructor
public class PromiseController {
    final MapService mapService;
    String dir = "promise/";

    @RequestMapping("/schedule")
    public String promise(Model model) throws Exception {
        model.addAttribute("center",dir+"schedulepromise");
        return "main";
    }

    @RequestMapping("/newpromise")
    public String newPromise(Model model) throws Exception {
        model.addAttribute("center",dir+"newpromise");
        return "main";
    }

    @RequestMapping("/detailpromise")
    public String detail(Model model) throws Exception {
        model.addAttribute("center",dir+"detailpromise");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/getpromise")
    public Object getpromise(Model model, @RequestParam("option") int proId) throws Exception {
        int devoteId = mapService.getDevoteId(proId);
        List<devoteCandidateDto> list = mapService.selectByDevote(devoteId);
        return list;
    }
}
