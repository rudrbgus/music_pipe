package com.meatjellyburgur.musicpipe.service;

import com.meatjellyburgur.musicpipe.dto.response.BoardListResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.TeamMemberInfoResponseDTO;
import com.meatjellyburgur.musicpipe.entity.TeamMemberInfo;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.TeamMemberInfoMapper;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TeamMemberInfoService {
    private final TeamMemberInfoMapper teamMemberInfoMapper;
    private final UserMapper userMapper;
    public List<TeamMemberInfoResponseDTO> findTeamMemberByTeamId(int teamId) {
        // 이 리스트가 돌때마다 이름 찾아와서 매핑해서 반납
        List<TeamMemberInfoResponseDTO> collect = new ArrayList<>();
        List<TeamMemberInfo> allTeamMember = teamMemberInfoMapper.findAllTeamMember(teamId);
        allTeamMember.forEach(member->{
            User user = userMapper.findUserByUserId(member.getUserId());
            String nickname = user.getNickname();

            TeamMemberInfoResponseDTO dto = TeamMemberInfoResponseDTO.builder()
                    .teamId(member.getTeamId())
                    .role(member.getRole())
                    .userId(member.getUserId())
                    .nickName(nickname)
                    .email(user.getEmail())
                    .profileImagePath(user.getProfileImagePath())
                    .equipmentId(member.getEquipmentId())
                    .build();
            collect.add(dto);


        });

       return  collect;
    }
}
