package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Equipment {
    private  int equipment_id;
    private String equipment_name;
    private int position_id;
}
