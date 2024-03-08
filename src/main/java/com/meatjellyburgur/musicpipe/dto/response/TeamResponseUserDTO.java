package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamResponseUserDTO {
    private String nickname;
    private int equipmentId;
    private String userProfileImagePath;
    private String userIntroduce;
    private int userId;
}
