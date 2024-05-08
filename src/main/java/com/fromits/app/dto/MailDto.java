package com.fromits.app.dto;

import lombok.*;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MailDto {
    private String address;
    private String title;
    private String message;
}
