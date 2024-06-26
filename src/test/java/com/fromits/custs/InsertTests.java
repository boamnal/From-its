package com.fromits.custs;

import com.fromits.app.dto.CustDto;
import com.fromits.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.Date;
import java.sql.SQLException;

@SpringBootTest
@Slf4j
class InsertTests {

  @Autowired
  CustService custService;

  @Test
  void contextLoads() {
    // mapper 파라미터 순서는 db 컬럼 순서와 맞혀줘야 함.
    CustDto custDto = CustDto.builder().userId("id04").email("id03@gmail.com").password("pwd04").address("서울 구로구").zipcode("07544").profile(1).name("김한주").build();

    try {
      custService.add(custDto);
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
