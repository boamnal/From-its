package com.fromits.app.repository;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MapRepository extends HanaRepository<Integer, devoteCandidateDto> {
    public devoteCandidateDto getById(Integer proId, long placeId);
    public List<devoteCandidateDto> selectByDevote(Integer devoteId);
    public int getDevoteId(int proId);
}
