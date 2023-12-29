package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PersonalAbility{
    private int userId;
    private int equipmentId;
    private String ability;


}
