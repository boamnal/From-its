package com.fromits.app.dto;

import lombok.*;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class FriendsDto {
  private String userId;
  private String userId2;
  // 조회 시 친구 이름, 프로필 사진 확인!
  private String name;
  private int profile;
}
