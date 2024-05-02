package com.fromits.controller;

import com.fromits.app.dto.CustDto;
import com.fromits.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FriendsController {
  String dir = "friends/";
  final CustService custService;

  @RequestMapping("/search")
  public String searchByTitle(Model model, @RequestParam("query") String query, @RequestParam("key") String key) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("searchKeyword", query);

    List<CustDto> list = null;

    try {
      if ("id".equals(key)) {
        list = custService.findInfoById(paramMap);
      }
      model.addAttribute("list2", list);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
    model.addAttribute("center", dir + "search");
    return "main";
  }
}

