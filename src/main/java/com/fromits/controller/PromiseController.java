package com.fromits.controller;
import com.fromits.app.dto.*;
import com.fromits.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    final VoteService voteService;

    @RequestMapping("/schedule")
    public String promise(Model model, HttpSession httpSession) throws Exception {
        String userId = (String) httpSession.getAttribute("user_id");
        List<PromiseDto> promise = promiseService.getConfirmPromise(userId);
        model.addAttribute("promise", promise);
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
    public String finalpromise(Model model, @RequestParam("devoteId") int devoteId) throws Exception {

        DevoteDto devoteDto = devoteService.getProId(devoteId);
        Map<String, Integer> placeresult = new HashMap<>();
        FinalPlaceDto finalPlace = promiseService.finalplace(devoteId);

        Integer proId = devoteDto.getProId();
        Integer candidateId = finalPlace.getCandidateId();

        placeresult.put("proId", proId);
        placeresult.put("candidateId", candidateId);

        promiseService.updateResult(placeresult);
        FinalPromiseDto finalPromiseInfo = promiseService.finalPromiseInfo(proId);

        model.addAttribute("proId",proId );
        model.addAttribute("devoteId",devoteId );
        model.addAttribute("promiseInfo",finalPromiseInfo );
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


    @ResponseBody
    @RequestMapping("/confirmPromise")
    public int confirmPromise(Model model, @RequestParam("proDate") String proDate, @RequestParam("proId") String proId, @RequestParam("devoteId") int devoteId) throws Exception {
        // 최종 약속 결정:1 , 이 과정 실패: 0
        Map<String, Object> params = new HashMap<>();
        params.put("proDate", proDate);
        params.put("proId", proId);


        Map<String, Object> updateVote = new HashMap<>();
        updateVote.put("devoteState", 3);
        updateVote.put("devoteId", proId);

        voteService.updateVoteState(updateVote);

        int result = promiseService.finalPromiseSchedule(params);

        return result;
    }
}
