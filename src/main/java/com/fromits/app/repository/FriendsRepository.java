package com.fromits.app.repository;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface FriendsRepository extends HanaRepository<String, FriendsDto> {
    // 친구 목록 조회
    List<FriendsDto> getMyFriends(String id) throws Exception;
    // 친구 목록 중 검색어(아이디, 이름)으로 친구 목록 다시 조회
    List<FriendsDto> searchMyFriends(@Param("userId") String userId, @Param("searchText") String searchText) throws Exception;
}
