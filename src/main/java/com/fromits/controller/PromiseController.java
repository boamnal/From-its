package com.fromits.controller;
import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PromiseController {
    final MapService mapService;
    String dir = "promise/";
    final GroupService groupService;
    final PromiseService promiseService;
    final FriendsService friendsService;
    final GroupmemberService groupmemberService;
    final DevoteService devoteService;
    final CustService custService;
//
//
//    @Value("${app.key.kakaokey}")
//    private String kakaoKey;

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

    @RequestMapping("/schedulepromise")
    public String schedulepromise(Model model, HttpSession session) throws Exception {
        List<devoteCandidateDto> list = promiseService.getPromise2("id01");
        model.addAttribute("list", list);
        model.addAttribute("center",dir+"schedulepromise");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/createpromise")
    public int createpromise(Model model, @RequestParam("promiseName") String promiseName, @RequestParam("promiseContent") String promiseContent, @RequestParam("groupId") int groupId, @RequestParam("midpointLat") double midpointLat, @RequestParam("midpointLon") double midpointLon) throws Exception {
        // 약속 생성 성공했을 시 1 반환
        PromiseDto promise = PromiseDto.builder()
                .proName(promiseName)
                .proDesc(promiseContent)
                .groupId(groupId)
                .proLat(midpointLat)
                .proLon(midpointLon)
                .build();

        promiseService.add(promise);
        return 1;
    }

    @ResponseBody
    @RequestMapping("/getFriendsAddress")
    public List<CustDto> getFriendsAddress(Model model, @RequestParam("groupId") int groupId) throws Exception {
        // 각 멤버의 주소를 리스트에 저장
        List<CustDto> memberAddress = custService.getMemberAddress(groupId);
        return memberAddress;
    }

    @RequestMapping("/finalpromise")
    public String finalpromise(Model model, HttpSession session) throws Exception {
        model.addAttribute("center",dir+"finalpromise");
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

    @ResponseBody
    @RequestMapping("/getStart")
    public Object getStart(Model model, @RequestParam("devoteId") int devoteId) throws Exception {
        devoteService.getStart(devoteId);
        return 1;
    }

    @ResponseBody
    @RequestMapping("/getCount")
    public Object getCount(Model model, @RequestParam("devoteId") String id) throws Exception {
        int count = promiseService.getCount(id);
        return count;
    }
}
