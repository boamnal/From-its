package com.fromits.app.service;

import com.fromits.app.dto.PromiseDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.PromiseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PromiseService implements HanaService<Integer, PromiseDto> {

    final PromiseRepository promiseRepository;

    @Override
    public int add(PromiseDto promiseDto) throws Exception {
        return promiseRepository.insert(promiseDto);
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
        return null;
    }

    @Override
    public List<PromiseDto> get() throws Exception {
        return null;
    }

    public List<PromiseDto> getPromise(String userId) throws Exception {
        return promiseRepository.getPromise(userId);
    }
}
