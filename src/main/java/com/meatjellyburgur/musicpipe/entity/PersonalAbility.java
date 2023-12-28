package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PersonalAbility {
    private int user_id;
    private  int equipment_id;
    private String ability;


}
