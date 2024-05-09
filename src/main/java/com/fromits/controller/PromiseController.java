package com.fromits.controller;
import com.fromits.app.dto.*;
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

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

import java.util.List;
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

    @Value("${app.key.username}")
    String mail;
    @Value("${app.key.password}")
    String pwd;
    public static void sendEmail(String to, String from, String host, String subject, String text, String pwd) {
        // 메일 서버 연결을 위한 프로퍼티 설정
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587"); // 대부분의 SMTP 서버는 587 포트 사용
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true"); // TLS 사용 설정

        // 인증 정보
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(from, pwd); // 발신자 이메일 계정과 비밀번호 입력
            }
        });

        try {
            // 메일 생성
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(text);

            // 메일 전송
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }

    final VoteService voteService;

    @RequestMapping("/schedule")
    public String promise(Model model, HttpSession httpSession) throws Exception {
        String userId = (String) httpSession.getAttribute("user_id");
        List<PromiseListDto> promise = promiseService.getConfirmPromise(userId);
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
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        PromiseDto dto = promiseService.get(id);
        List<CustDto> cust = custService.getMemberPromiseId(id);
        model.addAttribute("center",dir+"detailpromise");
        model.addAttribute("promise", dto);
        model.addAttribute("member",cust);
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

        List<String> emails = promiseService.getEmailsbyProId(Integer.parseInt(proId));
        for(String s: emails){
            sendEmail(s, mail, "smtp.gmail.com", "From-its", "투표가 완료되었습니다. 확인하세요", pwd);
        }
        voteService.updateVoteState(updateVote);

        int result = promiseService.finalPromiseSchedule(params);

        return result;
    }
}
