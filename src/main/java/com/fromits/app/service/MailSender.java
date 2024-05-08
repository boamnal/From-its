package com.fromits.app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@RequiredArgsConstructor
public class MailSender {

    @Value("${app.key.username}")
    static String mail;
    @Value("${app.key.password}")
    static String pwd;
    public static void sendEmail(String to, String from, String host, String subject, String text) {
        // 메일 서버 연결을 위한 프로퍼티 설정
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587"); // 대부분의 SMTP 서버는 587 포트 사용
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true"); // TLS 사용 설정

        // 인증 정보
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mail, pwd); // 발신자 이메일 계정과 비밀번호 입력
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

    public static void main(String[] args) {
        String to = "rkdalswn0833@naver.com"; // 수신자 이메일 주소
        String from = mail; // 발신자 이메일 주소
        String host = "smtp.gmail.com"; // 사용할 SMTP 서버 주소

        sendEmail(to, from, host, "Test Subject", "Hello, this is sample email to send email using JavaMailAPI");
    }
}
