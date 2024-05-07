package com.fromits.app.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class devoteCandidateDto {
    int candidateId;
	String placeName;
    String placeAddress;
    String userId;
    int proId;
    long placeId;
    int devoteId;
    LocalDate proNow;
	String lat;
    String log;
}
