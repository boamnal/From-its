package com.fromits.app.repository;

import com.fromits.app.dto.CustDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface CustRepository extends HanaRepository<String, CustDto> {
  List<CustDto> searchInfoById(Map<String, Object> searchKeyword);
  // 로그인 로직
  String searchId(@Param("name") String name, @Param("email") String email);

  String searchPwd(String id);

  // 해당 그룹 멤버의 주소 목록 반환
  List<CustDto> getMemberAddress(int groupId) throws Exception;

}
