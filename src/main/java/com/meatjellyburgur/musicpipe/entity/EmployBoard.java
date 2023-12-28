package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployBoard {
    private  int board_id;
    private int user_id;
    private String place;
    private int on_off;


}
