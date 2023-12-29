package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class BoardWriteRequestDTO {
    private  int userId;
    private String title;
    private String content;
}
