package com.fromits.app.dto;

import lombok.*;

import java.time.LocalDate;
@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PromiseDto {
    int pro_id;
    String pro_lat;
    String pro_name;
    LocalDate pro_date;
    String pro_desc;
    int group_id;
    int candidate_id;
}
