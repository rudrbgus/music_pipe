package com.meatjellyburgur.musicpipe.dto.request;

import lombok.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class BoardWriteRequestDTO {
    private int userId;
    private String title;
    private String content;
    private String vocal; //값이 on,off로 들어옴.
    private String piano;
    private String keyboard;
    private String acoustic;
    private String electric;
    private String base;
    private String drum;
    private String etc;


    // 악기 체크 여부만 반환하는 메서드
    public Map<String, String> returnEquipment() {
        Map<String, String> map = new HashMap<>() {{
            put("vocal", vocal);
            put("piano", piano);
            put("keyboard", keyboard);
            put("acoustic", acoustic);
            put("electric", electric);
            put("base", base);
            put("drum", drum);
            put("etc", etc);

        }};
        return map;


    }
}
