package com.fromits.app.dto;

import lombok.*;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class VoteDto {
    private String userId;
    private int candidateId;
    private int devoteId;
}
