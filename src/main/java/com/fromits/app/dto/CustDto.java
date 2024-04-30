package com.fromits.app.dto;

import lombok.*;

import java.sql.Date;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class CustDto {
  private Integer memberIdx;
  private String memberId;
  private String memberPw;
  private String memberName;
  private String memberEmail;
  private Integer memberEmailReceive;
  private Integer memberPwQuestion;
  private String memberPwAnswer;
  private String memberGender;
  private Date memberBirthDate;
  private Date memberJoinDate;
}
