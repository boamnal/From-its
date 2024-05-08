package com.fromits.app.service;

import com.fromits.app.dto.DevoteDto;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.DevoteRepository;
import com.fromits.app.repository.GroupRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class DevoteService implements HanaService<Integer, DevoteDto> {
    final DevoteRepository devoteRepository;

    @Override
    public int add(DevoteDto promgroupDto) throws Exception {
        return 0;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(DevoteDto promgroupDto) throws Exception {
        return 0;
    }

    @Override
    public DevoteDto get(Integer groupId) throws Exception {
        return devoteRepository.selectOne(groupId);
    }

    @Override
    public List<DevoteDto> get() throws Exception {
        return devoteRepository.select();
    }

    public int getStart(int id){
        return devoteRepository.getStart(id);
    }

    public DevoteDto getProId(int devoteId) throws Exception {
        return devoteRepository.getProId(devoteId);
    }

}
