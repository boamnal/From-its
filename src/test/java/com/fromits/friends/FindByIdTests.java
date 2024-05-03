package com.fromits.friends;

import com.fromits.app.dto.CustDto;
import com.fromits.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
@Slf4j
class FindByIdTests {

  @Autowired
  CustService custService;

  @Test
  void contextLoads() {
    try {
      // get 메서드 호출 결과를 변수에 저장

      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("searchKeyword", "id");

      List<CustDto> boardDtoList = custService.findInfoById(paramMap);

      // 반환된 boardList 로그에 출력

      log.info("--------------------------");
      log.info(boardDtoList.toString());

      boardDtoList.forEach(b->{
        log.info("--------------------------");
        log.info(b.toString());
      });

      log.info("----------OK----------------");
    } catch (Exception e) {
      if (e instanceof SQLException) {
        log.info("SQL 문법이 틀렸어요");
      } else if (e instanceof DuplicateKeyException) {
        log.info("----------ID가 중복되었어요----------------");
      } else {
        // 에러 확인
        e.printStackTrace();
        log.info("예상치 못한 모르는 에러가 발생했어요");
      }
    }
  }
}
