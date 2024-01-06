package com.meatjellyburgur.musicpipe.dto.request;


import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class BoardWriteEquipmentRequsetDTO {
    private String vocal; //값이 on,off로 들어옴.
    private String piano;
    private String keyboard;
    private  String acoustic;
    private String electric;
    private String base;
    private String drum;
    private String etc;
}
