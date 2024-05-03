package com.fromits.friends;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FriendsDto;
import com.fromits.app.service.CustService;
import com.fromits.app.service.FriendsService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class addTests {

  @Autowired
  FriendsService service;

  @Test
  void contextLoads() {
    FriendsDto dto = FriendsDto.builder().userId("id01").userId2("id02").build();

    try {
      service.addFriend(dto);
      log.info("----------OK----------------");
    } catch (Exception e) {
      if (e instanceof SQLException) {
        log.info("SQL 문법이 틀렸어요");
      } else if (e instanceof DuplicateKeyException) {
        log.info("----------ID가 중복되었어요----------------");
      } else {
        e.printStackTrace();
        log.info("예상치 못한 모르는 에러가 발생했어요");
      }
    }
  }
}
