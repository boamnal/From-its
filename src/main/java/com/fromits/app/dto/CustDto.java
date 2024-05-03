package com.fromits.app.dto;

import lombok.*;

import java.sql.Date;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class CustDto {
  private String userId;
  private String email;
  private String password;
  private String address;
  private String zipcode;
  private String name;
  private Integer profile;
}
