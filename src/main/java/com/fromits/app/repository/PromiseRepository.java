package com.fromits.app.repository;

import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface PromiseRepository extends HanaRepository<Integer, PromiseDto> {
    List<devoteCandidateDto> getPromise(String userId) throws Exception;
}
