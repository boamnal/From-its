package com.fromits.app.repository;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FriendsDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GroupRepository extends HanaRepository<Integer, PromgroupDto> {

    int newGroup(String name);

    public List<PromiseDto> getPromisebyGroupId(int groupId) throws Exception;
    void newGroup(String name);

}
