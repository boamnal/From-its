package com.fromits.app.service;

import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.GroupmemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
        groupmemberRepository.newGroupMember(userId, groupId);
    }
}
