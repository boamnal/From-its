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

  @PostMapping("/addFriend")
  public String addFriend(Model model, HttpSession session, @RequestParam("friendId") String friendId) throws Exception {
    // To DO
    // 회원가입 시 세션에 id 저장해둔 값을 가져와야 함
    // 회원가입 시 id를 세션에 저장해야 함
    String loggedInUserId = (String) session.getAttribute("user_id");
    if (loggedInUserId == null) {
      // 로그인된 사용자의 ID가 없으면 로그인 페이지로 리다이렉트 또는 다른 처리
      return "redirect:/login";
    }
    String userId = loggedInUserId;
    String userId2 = friendId;

    try {
      friendsService.addFriend(userId, userId2);
    } catch (Exception e) {
      e.printStackTrace();
    }
    model.addAttribute("center", dir + "search");

    return "main";
  }
}

