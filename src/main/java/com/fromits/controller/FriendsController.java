package com.fromits.controller;

import com.fromits.app.dto.FriendsDto;
import com.fromits.app.service.CustService;
import com.fromits.app.service.FriendsService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FriendsController {
  String dir = "friends/";
  final CustService custService;
  private final FriendsService friendsService;

  @RequestMapping("/search")
  public String search(Model model) {
    model.addAttribute("center", dir + "search");
    return "main";
  }

  @ResponseBody
  @RequestMapping("/searchOther")
  public List<FriendsDto> searchOther(@RequestParam("searchText") String searchText, HttpSession session) throws Exception {
    // 회원가입, 로그인 시 세션에 id 저장해둔 값 가져옴
    String loggedInUserId = (String) session.getAttribute("user_id");

    String userId = loggedInUserId;
    log.info("-------------------로그인한 사용자 아이디: " + userId);
    List<FriendsDto> searchOthers = friendsService.searchOther(userId, searchText);

    log.info("@@@searchOthers" + searchOthers.toString());
    return searchOthers;
  }

  @ResponseBody
  @RequestMapping("/getAll")
  public List<FriendsDto> getAll(HttpSession session) throws Exception {
    String loggedInUserId = (String) session.getAttribute("user_id");
    String userId = loggedInUserId;
    List<FriendsDto> myFriends = friendsService.getOther(userId);
    return myFriends;
  }

  // 친구 추가
  @ResponseBody
  @RequestMapping("/createNewFriend")
  public int createNewFriend(@RequestParam("friendId") String friendId, HttpSession session) {
    log.info("-------------------선택한 친구 아이디: ", friendId);

    String loggedInUserId = (String) session.getAttribute("user_id");
    try {
      friendsService.addFriend(loggedInUserId, friendId);

      return 1;
    } catch (Exception e) {
      return 0;
    }
  }
}

