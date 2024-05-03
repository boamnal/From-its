package com.fromits.app.service;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.FriendsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FriendsService implements HanaService<String, FriendsDto> {

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
  public int del(String s) throws Exception {
    return repository.delete(s);
  }

  @Override
  public int modify(FriendsDto friendsDto) throws Exception {
    return 0;
  }

  @Override
  public FriendsDto get(String s) throws Exception {
    return repository.selectOne(s);
  }

  @Override
  public List<FriendsDto> get() throws Exception {
    return repository.select();
  }
}
