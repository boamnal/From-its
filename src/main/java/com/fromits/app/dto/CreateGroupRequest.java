package com.fromits.app.dto;

import java.util.List;

public class CreateGroupRequest {
    private String groupName;
    private List<String> friendIds;

    // 기본 생성자
    public CreateGroupRequest() {
    }

    // groupName의 getter
    public String getGroupName() {
        return groupName;
    }

    // groupName의 setter
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    // friendIds의 getter
    public List<String> getFriendIds() {
        return friendIds;
    }

    // friendIds의 setter
    public void setFriendIds(List<String> friendIds) {
        this.friendIds = friendIds;
    }
}
