package com.fromits.custs;

import com.fromits.app.dto.CustDto;
import com.fromits.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
class modifyAddressTests {

  @Autowired
  CustService custService;

  @Test
  void contextLoads() throws Exception {
    CustDto id01 = custService.get("id01");
    id01.setAddress("서울 동작구 남부순환로 2003");
    id01.setZipcode("07021");

     custService.modifyAddress(id01);


    try {
      log.info("CustDto: {}", id01);

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
