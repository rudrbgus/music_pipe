package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor
public class UserInstrumentRequestDTO {
    private int instrumentId;
    private boolean onOff;
    private String email;
}
