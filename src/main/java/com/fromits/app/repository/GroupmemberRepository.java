package com.fromits.app.repository;

import com.fromits.app.dto.GroupmemberDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface GroupmemberRepository extends HanaRepository<Integer, GroupmemberDto> {
    void newGroupMember(Map<String, Object> params) throws Exception;
    List<String> getGroupMember(int groupId) throws Exception;
}
