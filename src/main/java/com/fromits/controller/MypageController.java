package com.fromits.controller;

import com.fromits.app.dto.*;
import com.fromits.app.service.CustService;
import com.fromits.app.service.FriendsService;
import com.fromits.app.service.GroupService;
import com.fromits.app.service.PromiseService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
  final GroupService groupService;

  @RequestMapping("/mypage")
  public String mypage(Model model, HttpSession session) throws Exception {
    String loggedInUserId = (String) session.getAttribute("user_id");
    CustDto custDto = custService.get(loggedInUserId);
    List<PromiseListDto> promise = promiseService.getConfirmPromise(loggedInUserId);
    List<PromgroupDto> group = groupService.getMyGroup(loggedInUserId);

    model.addAttribute("custInfo", custDto);
    model.addAttribute("promise", promise);
    model.addAttribute("group", group);
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
  // 친구 절교
  @ResponseBody
  @RequestMapping("/byeFriend")
  public int createNewFriend(@RequestParam("friendId") String friendId, HttpSession session) {
    log.info("-------------------선택한 친구 아이디: ", friendId);

    String loggedInUserId = (String) session.getAttribute("user_id");
    try {
      friendsService.byeFriend(friendId);
      return 1;
    } catch (Exception e) {
      return 0;
    }
  }
}
