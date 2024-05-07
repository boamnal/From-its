package com.fromits.app.service;

import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.GroupmemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GroupmemberService implements HanaService<String, GroupmemberService> {
    final GroupmemberRepository groupmemberRepository;

    @Override
    public int add(GroupmemberService groupmemberService) throws Exception {
        return 0;
    }

    @Override
    public int del(String string) throws Exception {
        return 0;
    }

    @Override
    public int modify(GroupmemberService groupmemberService) throws Exception {
        return 0;
    }

    @Override
    public GroupmemberService get(String string) throws Exception {
        return null;
    }

    @Override
    public List<GroupmemberService> get() throws Exception {
        return null;
    }

    public void newGroupMember(String userId, int groupId) throws Exception {
        Map<String, Object> params = new HashMap<>();

        params.put("userId", userId);
        params.put("groupId", groupId);

        groupmemberRepository.newGroupMember(params);
    }
}
