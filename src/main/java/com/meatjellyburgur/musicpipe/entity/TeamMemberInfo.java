package com.meatjellyburgur.musicpipe.entity;

import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString @EqualsAndHashCode
@Builder
public class TeamMemberInfo {
    private int teamId;
    private String role;
    private int equipmentId;
    private int userId;
}
