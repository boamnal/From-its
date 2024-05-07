package com.fromits.app.repository;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface FriendsRepository extends HanaRepository<String, FriendsDto> {
    List<FriendsDto> getMyFriends(String id) throws Exception;
    List<FriendsDto> searchMyFriends(String userId, String searchText) throws Exception;
    void addFriend(FriendsDto dto);
}
