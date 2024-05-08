package com.fromits.controller;
import com.fromits.app.dto.PromgroupDto;
import com.fromits.app.dto.PromiseDto;
import com.fromits.app.dto.devoteCandidateDto;
import com.fromits.app.service.GroupService;
import com.fromits.app.service.MapService;
import com.fromits.app.service.PromiseService;
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
@Slf4j
@RequiredArgsConstructor
public class PromiseController {
    final MapService mapService;
    String dir = "promise/";
    final GroupService groupService;
    final PromiseService promiseService;

    @RequestMapping("/schedule")
    public String promise(Model model) throws Exception {
        model.addAttribute("center",dir+"schedulepromise");
        return "main";
    }

    @RequestMapping("/newpromise")
    public String newPromise(Model model, @RequestParam("groupId") int groupId) throws Exception {
        PromgroupDto nowGroup = groupService.get(groupId);
        model.addAttribute("groupName",nowGroup.getGroupName());
        model.addAttribute("center",dir+"newpromise");
        return "main";
    }

    @RequestMapping("/schedulepromise")
    public String schedulepromise(Model model, HttpSession session) throws Exception {
        List<devoteCandidateDto> list = promiseService.getPromise("id01");
        model.addAttribute("list", list);
        model.addAttribute("center",dir+"schedulepromise");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/createpromise")
    public int createpromise(Model model, @RequestParam("promiseName") String promiseName, @RequestParam("promiseContent") String promiseContent, @RequestParam("groupId") int groupId) throws Exception {
        PromiseDto promise = PromiseDto.builder()
                .proName(promiseName)
                .proDesc(promiseContent)
                .groupId(groupId)
                .build();

        promiseService.add(promise);
        return 1;
    }


    @RequestMapping("/finalpromise")
    public String finalpromise(Model model, HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("user_id");
        List<devoteCandidateDto> list = promiseService.getPromise(userId);
        model.addAttribute("center",dir+"finalpromise");
        model.addAttribute("list",list);
        return "main";
    }

    @RequestMapping("/detailpromise")
    public String detail(Model model) throws Exception {
        model.addAttribute("center",dir+"detailpromise");
        return "main";
    }

    @ResponseBody
    @RequestMapping("/getpromise")
    public Object getpromise(Model model, @RequestParam("option") int proId) throws Exception {
        int devoteId = mapService.getDevoteId(proId);
        List<devoteCandidateDto> list = mapService.selectByDevote(devoteId);
        return list;
    }
}
