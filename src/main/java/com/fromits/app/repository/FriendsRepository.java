package com.fromits.app.repository;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface FriendsRepository extends HanaRepository<String, FriendsDto> {
    List<FriendsDto> getMyFriends(String id) throws Exception;
    List<FriendsDto> searchMyFriends(String userId, String searchText) throws Exception;

    // 친구 추가
    void addFriend(String userId, String userId2) throws Exception;
    List<FriendsDto> getOther(String id) throws Exception;
    List<FriendsDto> searchOther(String userId, String searchText) throws Exception;

  // 친구 절교
  void deleteFriend(String userId) throws Exception;
}
