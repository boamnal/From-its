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
  public String search(Model model) {
    model.addAttribute("center", dir + "search");
    return "main";
  }

  @RequestMapping("/searchById")
  public String searchById(Model model, @RequestParam(value = "query") String query) throws Exception {

    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("searchKeyword", query);

    List<CustDto> list = null;

    try {
      list = custService.findInfoById(paramMap);

      if (list.isEmpty()) {
        model.addAttribute("message", "해당하는 아이디가 없어요.");
      } else {
        model.addAttribute("list2", list);
      }
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
    model.addAttribute("center", dir + "search");
    return "main";
  }
}

