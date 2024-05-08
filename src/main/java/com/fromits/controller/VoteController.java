package com.fromits.controller;

import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.MapService;
import com.fromits.app.service.VoteService;
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
@RequiredArgsConstructor
@Slf4j
public class VoteController {
    String dir = "vote/";

    final MapService mapService;
    final VoteService voteService;


    @RequestMapping("/vote")
    public String vote(Model model, @RequestParam("id") int devoteId) throws Exception {
        List<devoteCandidateDto> list = mapService.selectByDevote(devoteId);
        model.addAttribute("list", list);
        model.addAttribute("devoteId", devoteId);
        model.addAttribute("center",dir+"vote");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/promiseVote")
    public int promiseVote(devoteCandidateDto candidate, HttpSession httpSession) throws Exception {
        // 이미 투표했으면 0, 처음 투표하면 1
        String userId = (String) httpSession.getAttribute("user_id");
        Integer devoteId = candidate.getDevoteId();
        Integer check = voteService.checkVote(userId, devoteId);
        if (check == 1) {
            return 0;
        } else {
            return 1;
        }
    }
}
