package com.fromits.controller;


import com.fromits.app.dto.FriendsDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.service.FriendsService;
import com.fromits.app.service.GroupService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class GroupController {

    String dir = "group/";
    final GroupService groupService;
    final FriendsService friendsService;

    @ResponseBody
    @RequestMapping("/searchFriends")
    public List<FriendsDto> searchMyFriends(@RequestParam("searchText") String searchText) throws Exception {
        List<FriendsDto> searchMyFriends = friendsService.searchMyFriends("id01", searchText);
        return searchMyFriends;
    }

    @ResponseBody
    @RequestMapping("/getAllFriends")
    public List<FriendsDto> getAllFriends() throws Exception {
        String userId = "id01";
        List<FriendsDto> myFriends = friendsService.getMyFriends(userId);
        return myFriends;
    }

//    @ResponseBody
//    @RequestMapping("/createNewGroup")
//    public int createNewGroup(@RequestBody CreateGroupRequest createGroupRequest) {
//        try {
//            groupService.newGroup(createGroupRequest.getGroupName());
//
//            for (String userId : createGroupRequest.getFriendIds()) {
//                groupmemberRepository.newGroupMember(userId);
//            }
//            return 1;
//        } catch (Exception e) {
//            return 0;
//        }
//    }


    @RequestMapping("/newgroup")
    public String newgroup(Model model) throws Exception {
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
