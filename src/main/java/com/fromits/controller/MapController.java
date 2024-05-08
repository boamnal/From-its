package com.fromits.controller;

import com.fromits.app.dto.DevoteDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.*;
import jakarta.servlet.http.HttpSession;
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
    final PromiseService promiseService;
    final DevoteService devoteService;
    String dir = "map/";
    @RequestMapping("")
    public String map(Model model, @RequestParam("id") int id) throws Exception {
        model.addAttribute("center", dir + "search");
        DevoteDto dto = devoteService.get(id);
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
    public Object candidate(devoteCandidateDto dto, HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("user_id");
        dto.setUserId(userId);
        devoteCandidateDto dto2 = mapService.getById(dto.getDevoteId(), dto.getPlaceId());
        if(dto2 == null) {
            mapService.add(dto);
            return 1;
        }else {
            return 0;
        }
    }

    @ResponseBody
    @RequestMapping("/getprom")
    public Object getprom(@RequestParam("option")int id, HttpSession session) throws Exception {
        PromiseDto promiseDto = promiseService.get(id);
        return promiseDto;
    }

    @ResponseBody
    @RequestMapping("/getbygroupId")
    public Object getAll(@RequestParam("option") int groupId, HttpSession session) throws Exception {
        List<devoteCandidateDto> list = groupService.getCandidateGroupById(groupId);
        return list;
    }


    @RequestMapping("/groupmp")
    public Object map(Model model, HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("user_id");
        List<PromgroupDto> list = groupService.getGroupById(userId);
        model.addAttribute("list", list);
        model.addAttribute("center", dir + "map");
        return "main";
    }
    @ResponseBody
    @RequestMapping("/getdevote")
    public DevoteDto getdevote(@RequestParam("devoteId") int devoteId) throws Exception {
        DevoteDto status = devoteService.get(devoteId);
        log.info("애" + status.toString());
        return status;
    }
}
