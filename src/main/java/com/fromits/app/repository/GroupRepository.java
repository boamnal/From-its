package com.fromits.app.repository;

import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GroupRepository extends HanaRepository<Integer, PromgroupDto> {
    public List<PromgroupDto> getGroupById(String userId);
    public List<PromiseDto> getPromisebyGroupId(int groupId) throws Exception;
    void newGroup(PromgroupDto promgroupDto);
    List<PromgroupDto> getMyGroup(String userId);
    public List<devoteCandidateDto> getCandidateGroupById(int groupId);
}
