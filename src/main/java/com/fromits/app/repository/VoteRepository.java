package com.fromits.app.repository;

import com.fromits.app.dto.VoteDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface VoteRepository extends HanaRepository<Integer, VoteDto> {
    Integer checkVote(VoteDto voteDto) throws Exception;
    Integer getVoteCount(int Integer) throws Exception;
    void updateVoteState(Map<String, Object> updateVote) throws Exception;
}
