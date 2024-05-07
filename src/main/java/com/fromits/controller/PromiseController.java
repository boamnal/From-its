package com.fromits.controller;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.GroupmemberDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.service.*;
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
    String dir = "promise/";
    final GroupService groupService;
    final PromiseService promiseService;
    final FriendsService friendsService;
    final GroupmemberService groupmemberService;
    final CustService custService;

    @RequestMapping("/schedule")
    public String promise(Model model) throws Exception {
        model.addAttribute("center",dir+"schedulepromise");
        return "main";
    }

    @RequestMapping("/newpromise")
    public String newPromise(Model model, @RequestParam("groupId") int groupId) throws Exception {
        PromgroupDto nowGroup = groupService.get(groupId);
        model.addAttribute("groupName",nowGroup.getGroupName());
        model.addAttribute("center",dir+"newpromise");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/createpromise")
    public int createpromise(Model model, @RequestParam("promiseName") String promiseName, @RequestParam("promiseContent") String promiseContent, @RequestParam("groupId") int groupId) throws Exception {
        // 약속 생성 성공했을 시 1 반환
        PromiseDto promise = PromiseDto.builder()
                .proName(promiseName)
                .proDesc(promiseContent)
                .groupId(groupId)
                .build();

        promiseService.add(promise);
        return 1;
    }

    @ResponseBody
    @RequestMapping("/getFriendsAddress")
    public int getFriendsAddress(Model model, @RequestParam("groupId") int groupId) throws Exception {
        // 각 멤버의 주소를 리스트에 저장
        List<String> memberAddress = custService.getMemberAddress(groupId);
        log.info(memberAddress.toString());

        return 1;
    }



    @RequestMapping("/finalpromise")
    public String finalpromise(Model model) throws Exception {
        model.addAttribute("center",dir+"finalpromise");
        return "main";
    }

    @RequestMapping("/detailpromise")
    public String detail(Model model) throws Exception {
        model.addAttribute("center",dir+"detailpromise");
        return "main";
    }
}
