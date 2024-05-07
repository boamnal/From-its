package com.fromits.app.service;

import com.fromits.app.dto.GroupmemberDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.GroupmemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GroupmemberService implements HanaService<Integer, GroupmemberDto> {
    final GroupmemberRepository groupmemberRepository;

    @Override
    public int add(GroupmemberDto groupmemberDto) throws Exception {
        return 0;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(GroupmemberDto groupmemberDto) throws Exception {
        return 0;
    }

    @Override
    public GroupmemberDto get(Integer groupId) throws Exception {
        return null;
    }

    @Override
    public List<GroupmemberDto> get() throws Exception {
        return null;
    }

    public void newGroupMember(String userId, int groupId) throws Exception {
        Map<String, Object> params = new HashMap<>();

        params.put("userId", userId);
        params.put("groupId", groupId);

        groupmemberRepository.newGroupMember(params);
    }

    public List<String> getGroupMember(int groupId) throws Exception {
        List<String> groupMember = groupmemberRepository.getGroupMember(groupId);
        return groupMember;
    }
}
