package com.fromits.app.repository;

import com.fromits.app.dto.GroupmemberDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GroupmemberRepository extends HanaRepository<String, GroupmemberDto> {
    void newGroupMember(String userId, int groupId) throws Exception;
}
