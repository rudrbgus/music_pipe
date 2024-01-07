package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.common.Page;
import com.meatjellyburgur.musicpipe.common.PageMaker;
import com.meatjellyburgur.musicpipe.dto.request.TeamRegisterRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamListResponseDTO;
import com.meatjellyburgur.musicpipe.entity.*;
import com.meatjellyburgur.musicpipe.repository.*;
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
    private final TeamMemberInfoMapper teamMemberInfoMapper;
    private final PersonalAbilityMapper personalAbilityMapper;
    private final UserMapper userMapper;

    //전체 조회
    public TeamListResponseDTO getList(Page page) {
        List<TeamDetailResponseDTO> allTeamList = teamMapper.findAllTeam()
                .stream()
                .map(TeamDetailResponseDTO::new)
                .collect(Collectors.toList());

        //DB에서 team 총 댓글수 조회
        int count = teamMapper.count();


//        return TeamListResponseDTO.builder()
//                .count(count)
//                .teamDetailList(allTeamList)
//                .pageInfo(new PageMaker(page,count))
//                .build();
        return null;
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


        int count = findTeamList.size();

        return TeamListResponseDTO.builder()
                .count(count)
                .teamDetailList(findTeamList)
                .pageInfo(new PageMaker(page, count))
                .build();
    }

    public void createTeam(TeamRegisterRequestDTO dto) {
        //팀 생성하는 서비스
        //1. 일단 기본 권한은 CHIEF(팀장)으로
        teamMapper.save(dto.getTeamName());
        //처음 부터 첫행만 가져와서 team_id 다시 얻기
        int teamId = teamMapper.findLastRowTeamInfo();
        log.info("teamid :{}", teamId);
        //team_member_info 에 team_id roll(auth) equipment_id 넣기
        int userId = dto.getUserId();
        log.info("user id {}", userId);
        //team_id update 하기
        userMapper.updateTeamId(userId, teamId);
        // equipment_id -> user_id 기반 악기 가져오기
//        PersonalAbility personalAbility = personalAbilityMapper.findOne(userId);

        TeamMemberInfo teamMemberInfo = TeamMemberInfo.builder()
                .role(String.valueOf(Auth.CHIEF))
                .teamId(teamId)
                .userId(userId)
                .build();

        log.info("teamMemberinfo{}", teamMemberInfo);
        teamMemberInfoMapper.saveTeamMember(teamMemberInfo);




    }

    public String findTeamName(int teamId){
        Team team = teamMapper.findOneTeamById(teamId);
        return team.getTeamName();
    }
}
