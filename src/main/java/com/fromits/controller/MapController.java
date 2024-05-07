package com.fromits.controller;

import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.GroupService;
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
@RequestMapping("/map")
public class MapController {
    final GroupService groupService;
    final MapService mapService;
    String dir = "map/";
    @RequestMapping("")
    public String map(Model model, @RequestParam("id") int id) throws Exception {
        model.addAttribute("center", dir + "search");
        model.addAttribute("devote", id);
        return "main";
    }

    @RequestMapping("/group")
    public String group(Model model, @RequestParam("id") int groupId) throws Exception {
        List<PromiseDto> list = groupService.getPromisebyGroupId(groupId);
        model.addAttribute("center", dir + "groupmap");
        model.addAttribute("options", list);
        return "main";
    }

    @ResponseBody
    @RequestMapping("/addcandidate")
    public Object candidate(devoteCandidateDto dto) throws Exception {
        dto.setDevoteId(0);
        System.out.println(dto.toString());
        devoteCandidateDto dto2 = mapService.getById(dto.getDevoteId(), dto.getPlaceId());
        if(dto2 == null) {
            mapService.add(dto);
            return 1;
        }else {
            return 0;
        }
    }

    @ResponseBody
    @RequestMapping("/getpromise")
    public Object getpromise(@RequestParam("option") String id) throws Exception {
        System.out.println(id);
        return 1;
    }
}
