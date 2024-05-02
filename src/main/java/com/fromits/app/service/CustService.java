package com.fromits.app.service;

import com.fromits.app.dto.CustDto;
import com.fromits.app.frame.HanaService;
import com.fromits.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustService implements HanaService<String, CustDto> {


  final CustRepository custRepository;

  @Override
  public int add(CustDto custDto) throws Exception {
    return custRepository.insert(custDto);
  }

  @Override
  public int del(String s) throws Exception {
    return custRepository.delete(s);
  }

  @Override
  public int modify(CustDto custDto) throws Exception {
    return custRepository.update(custDto);
  }

  @Override
  public CustDto get(String s) throws Exception {
    return custRepository.selectOne(s);
  }

  @Override
  public List<CustDto> get() throws Exception {
    return custRepository.select();
  }
}
