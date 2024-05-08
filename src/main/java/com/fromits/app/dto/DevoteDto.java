package com.fromits.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DevoteDto {
    private int devoteId;
    private int proId;
    private int devote_state;
}
