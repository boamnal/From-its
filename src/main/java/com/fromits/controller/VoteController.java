package com.fromits.controller;

import com.fromits.app.dto.VoteDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.MapService;
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


//        sendEmail("rkdalswn0833@gmail.com", mail, "smtp.gmail.com", "From-its", "투표가 완료되었습니다. 확인하세요", pwd);

    }
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

}
