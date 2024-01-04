package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.TeamMemberInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamMemberInfoMapper {
    void saveTeamMember(TeamMemberInfo teamMemberInfo);
}
