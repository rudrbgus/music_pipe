package com.meatjellyburgur.musicpipe.dto.response;

import com.meatjellyburgur.musicpipe.entity.Team;
import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamDetailResponseDTO {
    private int teamId;
    private String teamName;


    //엔터티에서 teamId랑 teamName 가져 와야함
    public TeamDetailResponseDTO(Team team) {
        this.teamId=team.getTeamId();
        this.teamName=team.getTeamName();
    }



}
