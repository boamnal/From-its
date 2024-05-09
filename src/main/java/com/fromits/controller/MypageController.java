package com.fromits.controller;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FriendsDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.service.CustService;
import com.fromits.app.service.FriendsService;
import com.fromits.app.service.PromiseService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor

public class MypageController {
  String dir = "my/";
  final CustService custService;
  final FriendsService friendsService;
  final PromiseService promiseService;

  @RequestMapping("/mypage")
  public String mypage(Model model, HttpSession session) throws Exception {
    String loggedInUserId = (String) session.getAttribute("user_id");
    CustDto custDto = custService.get(loggedInUserId);
    List<PromiseDto> promise = promiseService.getConfirmPromise(loggedInUserId);


    model.addAttribute("custInfo", custDto);
    model.addAttribute("promise", promise);
    model.addAttribute("center", dir + "mypage");
    return "main";
  }

  // 주소록 업데이트
  @PostMapping("/updateAddress")
  @ResponseBody
  public String updateAddress(@RequestBody CustDto custDto, HttpSession session) throws Exception {
    log.info("$$$$$$$$$");
    log.info(custDto.toString());

    custService.modifyAddress(custDto);

    return "주소가 업데이트되었습니다.";
  }

  // 친구 목록 조회(group에서 정의한 함수로 매핑)
  @ResponseBody
  @RequestMapping("/group/getAllFriends")
  public List<FriendsDto> getAllFriends(HttpSession httpSession) throws Exception {
    String userId = (String) httpSession.getAttribute("user_id");
    List<FriendsDto> myFriends = friendsService.getMyFriends(userId);
    return myFriends;
  }
}
