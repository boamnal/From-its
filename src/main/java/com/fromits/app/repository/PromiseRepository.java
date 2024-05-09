package com.fromits.app.repository;

import com.fromits.app.dto.FinalPlaceDto;
import com.fromits.app.dto.FinalPromiseDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PromiseRepository extends HanaRepository<Integer, PromiseDto> {
    List<devoteCandidateDto> getPromise2(String userId) throws Exception;
    List<PromiseDto> getConfirmPromise(String userId) throws Exception;
    public int getCount(String id);
    FinalPlaceDto finalplace(int devoteId) throws Exception;
    int updateResult( Map<String, Integer> updateResult) throws Exception;
    FinalPromiseDto finalPromiseInfo(int proId) throws Exception;
    int finalPromiseSchedule(Map<String, Object> scheduler) throws Exception;

}
