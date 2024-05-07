package com.fromits.app.service;

import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.MapRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MapService implements HanaService<Integer, devoteCandidateDto> {


  final MapRepository mapRepository;

  @Override
  public int add(devoteCandidateDto custDto) throws Exception {
    return mapRepository.insert(custDto);
  }

  @Override
  public int del(Integer integer) throws Exception {
    return mapRepository.delete(integer);
  }

  @Override
  public int modify(devoteCandidateDto custDto) throws Exception {
    return mapRepository.update(custDto);
  }

  @Override
  public devoteCandidateDto get(Integer s) throws Exception {
    return mapRepository.selectOne(s);
  }

  @Override
  public List<devoteCandidateDto> get() throws Exception {
    return mapRepository.select();
  }


  public devoteCandidateDto getById(Integer proId, long placeId) throws Exception {
    return mapRepository.getById(proId, placeId);
  }
  public List<devoteCandidateDto> selectByDevote(Integer devoteId) throws Exception {
    return mapRepository.selectByDevote(devoteId);
  }
}
