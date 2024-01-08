package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamMemberInfoResponseDTO {
    private int teamId;
    private String role;
    private int equipmentId;
    private int userId;
    private String nickName;
    private String email;
    private String profileImagePath;

}
