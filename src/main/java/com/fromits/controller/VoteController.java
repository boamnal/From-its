package com.fromits.controller;

import com.fromits.app.dto.FinalPlaceDto;
import com.fromits.app.dto.VoteDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.MapService;
import com.fromits.app.service.PromiseService;
import com.fromits.app.service.VoteService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;
import com.sun.mail.util.MailLogger;

@Controller
@RequiredArgsConstructor
@Slf4j
public class VoteController {
    String dir = "vote/";


    final MapService mapService;
    final VoteService voteService;
    final PromiseService promiseService;


    @RequestMapping("/vote")
    public String vote(Model model, @RequestParam("id") int devoteId) throws Exception {
        List<devoteCandidateDto> list = mapService.selectByDevote(devoteId);

        model.addAttribute("list", list);
        model.addAttribute("devoteId", devoteId);
        model.addAttribute("center",dir+"vote");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/checkVote")
    public int checkVote(VoteDto vote, HttpSession httpSession) throws Exception {
        // 이미 투표했으면 0, 처음 투표하면 1
        String userId = (String) httpSession.getAttribute("user_id");

        int devoteId = vote.getDevoteId();
        VoteDto voteDto = VoteDto.builder().userId(userId).devoteId(devoteId).build();
        Integer check = voteService.checkVote(voteDto);

        if (check == 1) {
            return 0;
        } else {
            return 1;
        }
    }

    @ResponseBody
    @RequestMapping("/candidateVote")
    public int candidateVote(VoteDto vote, HttpSession httpSession) throws Exception {
        // 투표 성공: 1, 투표 실패: 0
        String userId = (String) httpSession.getAttribute("user_id");

        int devoteId = vote.getDevoteId();
        int candidateId = vote.getCandidateId();
        VoteDto voteDto = VoteDto.builder().userId(userId).devoteId(devoteId).candidateId(candidateId).build();

        Integer devoteCheck = voteService.add(voteDto);

        return devoteCheck;
    }

    @ResponseBody
    @RequestMapping("/voteConfirm")
    public int voteConfirm(VoteDto vote, HttpSession httpSession) throws Exception {
        // 약속 후보 확정 가능: 1, 약속 후보 확정 불가능: 0

        // 투표 안한 사람 수
        Integer notVoteCount = voteService.getVoteCount();
        if (notVoteCount == 0) {
            Map<String, Object> updateVote = new HashMap<>();
            updateVote.put("devoteState", 2);
            updateVote.put("devoteId", vote.getDevoteId());

            voteService.updateVoteState(updateVote);

            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping("/finalplace")
    public String finalplace(Model model, @RequestParam("devoteId") int devoteId ) throws Exception {
        FinalPlaceDto finalPlace = promiseService.finalplace(devoteId);

        model.addAttribute("finalPlace", finalPlace);
        model.addAttribute("center",dir+"finalvoteplace");
        return "main";
    }

}
