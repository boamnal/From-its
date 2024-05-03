package com.fromits.app.dto;

import lombok.*;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class FriendsDto {
  private String userId; // 친구 추가하는 사용자 id
  private String userId2; // 친구 추가되는 사용자 id(friendId)

}
