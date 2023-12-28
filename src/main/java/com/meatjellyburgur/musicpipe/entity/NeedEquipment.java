package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NeedEquipment {
    private int board_id;
    private  int equipment_id;
    private String ability;
}
