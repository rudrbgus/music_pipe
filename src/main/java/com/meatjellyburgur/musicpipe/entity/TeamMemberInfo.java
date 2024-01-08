package com.meatjellyburgur.musicpipe.entity;

import lombok.*;

@Getter @ToString @EqualsAndHashCode
@Setter
@Builder
public class TeamMemberInfo {
    private int teamId;
    private String role;
    private int equipmentId;
    private int userId;
    private int license;
}
