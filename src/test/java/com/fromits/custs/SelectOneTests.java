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
class SelectOneTests {

  @Autowired
  CustService custService;

  @Test
  void contextLoads() throws Exception {
    // get 메서드 호출 결과를 변수에 저장
    CustDto custDto = custService.get("chuncoo");

    String address = custDto.getAddress();
    String zipcode = custDto.getZipcode();

    // 반환된 CustDto를 로그에 출력
    log.info("CustDto: {}", custDto);
    log.info("_______" + address + "______" + zipcode);

    log.info("----------OK----------------");

    try {
//      custService.add(custDto);
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
