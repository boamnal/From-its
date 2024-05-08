package com.fromits.app.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FinalPromiseDto {
    private String placeAddress;
    private String proName;
    private String proDesc;
    private String groupName;
}
