package com.fromits.app.service;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.CustRepository;
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
    public PromgroupDto get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<PromgroupDto> get() throws Exception {
        return groupRepository.select();
    }

    public int newGroup(String name) throws Exception {
        PromgroupDto group = new PromgroupDto();
        group.setGroupName(name);
        groupRepository.newGroup(name);
        return group.getGroupId();
    }
}
