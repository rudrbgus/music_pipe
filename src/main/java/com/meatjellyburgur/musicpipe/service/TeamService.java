package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.dto.response.TeamDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamListResponseDTO;
import com.meatjellyburgur.musicpipe.entity.Team;
import com.meatjellyburgur.musicpipe.repository.TeamMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class TeamService {
    private final TeamMapper teamMapper;
    //전체 조회
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

    //키워드별 단일조회
    public TeamListResponseDTO getListByKeyWord(Page page, String type, String keyWord) {

        /**
         * type=team_name(api name) 이면 이름으로 검색
         * type=team_id(api name) 이면 아이디로 검색
         */

        List<TeamDetailResponseDTO> findTeamList = teamMapper.findTeamByKeyword(type, keyWord)
                .stream()
                .map(TeamDetailResponseDTO::new)
                .collect(Collectors.toList());


        int count=findTeamList.size();

        return TeamListResponseDTO.builder()
                .count(count)
                .teamDetailList(findTeamList)
                .pageInfo(new PageMaker(page,count))
                .build();
    }
}
