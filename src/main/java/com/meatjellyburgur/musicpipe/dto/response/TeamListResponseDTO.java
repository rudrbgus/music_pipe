package com.meatjellyburgur.musicpipe.dto.response;

import com.meatjellyburgur.musicpipe.common.PageMaker;
import lombok.*;

import java.util.List;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamListResponseDTO {
    private int count;
    //private PageMaker pageInfo;
    private List<TeamDetailResponseDTO> teamDetailList;

}
