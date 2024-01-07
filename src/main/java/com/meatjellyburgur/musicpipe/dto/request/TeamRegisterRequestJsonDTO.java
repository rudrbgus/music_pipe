package com.meatjellyburgur.musicpipe.dto.request;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@EqualsAndHashCode
public class TeamRegisterRequestJsonDTO {
    private String teamName;
    private int instrumentId;
    private String role;

}
