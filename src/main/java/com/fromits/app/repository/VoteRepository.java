package com.fromits.app.repository;

import com.fromits.app.dto.VoteDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface VoteRepository extends HanaRepository<Integer, VoteDto> {
    Integer checkVote(VoteDto voteDto) throws Exception;
    Integer getVoteCount() throws Exception;
    Integer groupMemberCount() throws Exception;
}
