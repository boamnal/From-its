package com.fromits.app.dto;

import lombok.*;

import java.time.LocalDate;
@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PromiseDto {
    int proId;
    double proLat;
    double proLon;
    String proName;
    LocalDate proDate;
    String proDesc;
    int groupId;
    int candidateId;
}
