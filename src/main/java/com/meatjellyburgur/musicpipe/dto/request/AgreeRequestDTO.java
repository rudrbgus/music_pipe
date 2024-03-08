package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AgreeRequestDTO {
    private String agreeName;
    private int userId;
}
