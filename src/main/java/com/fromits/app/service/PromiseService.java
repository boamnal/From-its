package com.fromits.app.service;

import com.fromits.app.dto.*;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.DevoteRepository;
import com.fromits.app.repository.PromiseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PromiseService implements HanaService<Integer, PromiseDto> {

    final PromiseRepository promiseRepository;
    final DevoteRepository devoteRepository;

    @Override
    public int add(PromiseDto promiseDto) throws Exception {
        promiseRepository.insert(promiseDto);
        DevoteDto dto = DevoteDto.builder().
                        proId(promiseDto.getProId()).build();
        devoteRepository.insert(dto);
        return promiseDto.getProId();
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(PromiseDto promiseDto) throws Exception {
        return 0;
    }

    @Override
    public PromiseDto get(Integer integer) throws Exception {
        return promiseRepository.selectOne(integer);
    }

    @Override
    public List<PromiseDto> get() throws Exception {
        return null;
    }

    public List<devoteCandidateDto> getPromise2(String userId) throws Exception {
        return promiseRepository.getPromise2(userId);
    }

    public int getCount(String id){
        return promiseRepository.getCount(id);
    }

    public List<PromiseDto> getPromise(String userId) throws Exception {
        return promiseRepository.getPromise(userId);
    }

    public FinalPlaceDto finalplace(int devoteId) throws Exception {
        return promiseRepository.finalplace(devoteId);
    }
    public int updateResult( Map<String, Integer> updateResult) throws Exception {
        return promiseRepository.updateResult(updateResult);
    }
    public FinalPromiseDto finalPromiseInfo(Integer proId) throws Exception {
        return promiseRepository.finalPromiseInfo(proId);
    }
    public int finalPromiseSchedule(Map<String, Object> scheduler) throws Exception {
        return promiseRepository.finalPromiseSchedule(scheduler);
    }
}
