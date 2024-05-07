package com.fromits.controller;

import com.fromits.app.dto.CustDto;
import com.fromits.app.dto.FriendsDto;
import com.fromits.app.service.CustService;
import com.fromits.app.service.FriendsService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
  private final FriendsService friendsService;

  @RequestMapping("/search")
  public String search(Model model) {
    model.addAttribute("center", dir + "search");
    return "main";
  }

  //  @RequestMapping("/searchById")
//  public String searchById(Model model, @RequestParam(value = "query") String query) throws Exception {
//
//    Map<String, Object> paramMap = new HashMap<>();
//    paramMap.put("searchKeyword", query);
//
//    List<CustDto> list = null;
//
//    try {
//      list = custService.findInfoById(paramMap);
//
//      if (list.isEmpty()) {
//        model.addAttribute("message", "해당하는 아이디가 없어요.");
//      } else {
//        model.addAttribute("list2", list);
//      }
//    } catch (Exception e) {
//      e.printStackTrace();
//      throw new RuntimeException(e);
//    }
//    model.addAttribute("center", dir + "search");
//    return "main";
//  }
//
//  // 친구 추가
//  @PostMapping("/addFriend")
//  public String addFriend(Model model, HttpSession session, @RequestParam("friendId") String friendId) throws Exception {
//    // To DO
//    // 회원가입 시 세션에 id 저장해둔 값을 가져와야 함
//    // 회원가입 시 id를 세션에 저장해야 함
//    String loggedInUserId = (String) session.getAttribute("user_id");
//    String userId = loggedInUserId;
//    String userId2 = friendId;
//
//    log.info("@@@@@@@@@@@");
//    log.info(userId);
//    log.info(friendId);
//
//    try {
//      if (loggedInUserId == null) {
//        // 로그인된 사용자의 ID가 없으면 로그인 페이지로 리다이렉트 또는 다른 처리
//        return "redirect:/login";
//      }
//      if (loggedInUserId == userId2) { // 본인 클릭시 리다이렉트
//        model.addAttribute("center", dir + "search");
//        return "main";
//      }
//      friendsService.addFriend(userId, userId2);
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//    model.addAttribute("center", dir + "search");
//
//    return "main";
//  }
  @ResponseBody
  @RequestMapping("/searchOther")
  public List<FriendsDto> searchOther(@RequestParam("searchText") String searchText, HttpSession session) throws Exception {
    // 회원가입, 로그인 시 세션에 id 저장해둔 값 가져옴
    String loggedInUserId = (String) session.getAttribute("user_id");

    String userId = loggedInUserId;
    log.info("-------------------로그인한 사용자 아이디: " + userId);
    List<FriendsDto> searchOthers = friendsService.searchOther(userId, searchText);

    log.info("@@@searchOthers"+searchOthers.toString());
    return searchOthers;
  }

  @ResponseBody
  @RequestMapping("/getAll")
  public List<FriendsDto> getAll(HttpSession session) throws Exception {
    String loggedInUserId = (String) session.getAttribute("user_id");
    log.info("@@@@@@@@@@@@@@@@@@@@@@"+loggedInUserId);
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

