package com.fromits.app.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VoteDto {
    private String userId;
    private int candidateId;
    private int devoteId;
}
