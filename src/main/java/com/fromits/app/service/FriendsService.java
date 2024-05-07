package com.fromits.app.service;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.FriendsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FriendsService implements HanaService<Integer, FriendsDto> {

    final FriendsRepository repository;

    public int addFriend(FriendsDto friendsDto) throws Exception {
        repository.addFriend(friendsDto);
        return 0;
    }
    @Override
    public int add(FriendsDto friendsDto) throws Exception {
        return 0;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(FriendsDto friendsDto) throws Exception {
        return 0;
    }

    @Override
    public FriendsDto get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<FriendsDto> get() throws Exception {
        return null;
    }

    public List<FriendsDto> getMyFriends(String userId) throws Exception {
        return repository.getMyFriends(userId);
    }

    public List<FriendsDto> searchMyFriends(String userId, String searchText) throws Exception {
        return repository.searchMyFriends(userId, searchText);
    }
}