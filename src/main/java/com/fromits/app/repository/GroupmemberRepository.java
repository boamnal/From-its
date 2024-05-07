package com.fromits.app.repository;

import com.fromits.app.dto.GroupmemberDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface GroupmemberRepository extends HanaRepository<String, GroupmemberDto> {
    void newGroupMember(Map<String, Object> params) throws Exception;
}
