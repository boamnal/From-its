package com.fromits.app.service;

import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.GroupRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class GroupService implements HanaService<Integer, PromgroupDto> {
    final GroupRepository groupRepository;

    @Override
    public int add(PromgroupDto promgroupDto) throws Exception {
        return 0;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(PromgroupDto promgroupDto) throws Exception {
        return 0;
    }

    @Override
    public PromgroupDto get(Integer groupId) throws Exception {
        return groupRepository.selectOne(groupId);
    }

    @Override
    public List<PromgroupDto> get() throws Exception {
        return groupRepository.select();
    }

    public List<PromiseDto> getPromisebyGroupId(int groupId) throws Exception{
        return groupRepository.getPromisebyGroupId(groupId);
    }

    public int newGroup(PromgroupDto promgroupDto) {
        groupRepository.newGroup(promgroupDto);
        return promgroupDto.getGroupId();
    }

    public List<PromgroupDto> getGroupById(String userId) {
        return groupRepository.getGroupById(userId);
    }

    public List<PromgroupDto> getMyGroup(String userId) {
        return groupRepository.getMyGroup(userId);
    }
    public List<devoteCandidateDto> getCandidateGroupById(int groupId) {
        return groupRepository.getCandidateGroupById(groupId);
    }

}
