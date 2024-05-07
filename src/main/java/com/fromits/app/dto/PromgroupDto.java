package com.fromits.app.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PromgroupDto {
    private int groupId;
    private String groupName;

    public PromgroupDto(String groupName) {
        this.groupName = groupName;
    }
}
