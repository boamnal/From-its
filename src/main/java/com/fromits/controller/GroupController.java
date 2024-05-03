package com.fromits.controller;


import com.fromits.app.dto.FriendsDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.service.FriendsService;
import com.fromits.app.service.GroupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class GroupController {

    String dir = "group/";
    final GroupService groupService;
    final FriendsService friendsService;

    @RequestMapping("/newgroup")
    public String newgroup(Model model) throws Exception {
        String userId = "id01";
        List<FriendsDto> myFriends = friendsService.getMyFriends(userId);
        model.addAttribute("friends",myFriends);
        model.addAttribute("center",dir+"newgroup");
        return "main";
    }
    @RequestMapping("/existgroup")
    public String existgroup(Model model) throws Exception {
        List<PromgroupDto> group = groupService.get();
        model.addAttribute("group", group);
        model.addAttribute("center",dir+"existgroup");
        return "main";
    }
    @RequestMapping("/mygroup")
    public String mygroup(Model model) throws Exception {
        model.addAttribute("center",dir+"mygroup");
        return "main";
    }
}
