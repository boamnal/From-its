package com.fromits.app.repository;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface FriendsRepository extends HanaRepository<String, FriendsDto> {

  void addFriend(FriendsDto dto);

}
