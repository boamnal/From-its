package com.fromits.app.service;

import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.VoteDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.PromiseRepository;
import com.fromits.app.repository.VoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VoteService implements HanaService<Integer, VoteDto>  {

    final VoteRepository voteRepository;

    @Override
    public int add(VoteDto voteDto) throws Exception {
        voteRepository.insert(voteDto);
        return 1;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(VoteDto voteDto) throws Exception {
        return 0;
    }

    @Override
    public VoteDto get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<VoteDto> get() throws Exception {
        return null;
    }

    public Integer checkVote(VoteDto voteDto) throws Exception {
        return voteRepository.checkVote(voteDto);
    }

    public Integer getVoteCount() throws Exception {
        return voteRepository.getVoteCount();
    }

    public Integer groupMemberCount() throws Exception {
        return voteRepository.groupMemberCount();
    }
}
