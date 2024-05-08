package com.fromits.app.service;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FinalPlaceDto;
import com.fromits.app.dto.DevoteDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.DevoteRepository;
import com.fromits.app.repository.PromiseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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


}
