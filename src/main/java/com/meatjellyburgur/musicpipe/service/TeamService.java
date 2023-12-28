package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.dto.response.TeamDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamListResponseDTO;
import com.meatjellyburgur.musicpipe.entity.Team;
import com.meatjellyburgur.musicpipe.repository.TeamMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class TeamService {
    private final TeamMapper teamMapper;
    public TeamListResponseDTO getList(Page page) {
        List<TeamDetailResponseDTO> allTeamList = teamMapper.findAllTeam()
                .stream()
                .map(TeamDetailResponseDTO::new)
                .collect(Collectors.toList());

        //DB에서 team 총 댓글수 조회
        int count=teamMapper.count();


        return TeamListResponseDTO.builder()
                .count(count)
                .teamDetailList(allTeamList)
                .pageInfo(new PageMaker(page,count))
                .build();
    }
}
