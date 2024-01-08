package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.TeamMemberInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeamMemberInfoMapper {
    void saveTeamMember(TeamMemberInfo t);

    List<TeamMemberInfo> findAllTeamMember(int teamId);

    List<TeamMemberInfo> findAllTeamMemberByTeamId(int teamId);
}
