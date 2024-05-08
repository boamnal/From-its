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
public class FinalPlaceDto {
    private String placeName;
    private String placeAddress;
    private int candidateId;
    private int devoteId;
    private int totalVotes;
    private LocalDate registrationDate;
}
