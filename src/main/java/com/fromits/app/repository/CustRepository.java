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

}
