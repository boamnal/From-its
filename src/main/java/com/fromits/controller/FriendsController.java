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

@Controller
@RequiredArgsConstructor
@Slf4j
public class FriendsController {
  String dir = "friends/";
  final CustService custService;

  @RequestMapping("/search")
  public String search(Model model) throws Exception {
    model.addAttribute("center",dir+"search");
    return "main";
  }




}

