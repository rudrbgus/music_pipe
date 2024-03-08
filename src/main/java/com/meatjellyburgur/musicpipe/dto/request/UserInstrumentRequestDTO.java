package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Setter @Getter @ToString
@EqualsAndHashCode @NoArgsConstructor
@AllArgsConstructor
public class UserInstrumentRequestDTO {
    @Min(value=1, message = "instrumentId는 1이상이어야 합니다.")
    private int instrumentId;
    private boolean onOff;
    @NotNull
    private String email;
}
