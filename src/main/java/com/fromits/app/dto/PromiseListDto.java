package com.fromits.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PromiseListDto {
    private int proId;
    private String proName;
    private int groupId;
    private String groupName;
    private LocalDate proDate;
    private String placeAddress;
    private String placeName;
}
