package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.dto.response.TeamDetailResponseDTO;
import com.meatjellyburgur.musicpipe.entity.Team;
import com.meatjellyburgur.musicpipe.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface TeamMapper {
    //회원 가입
    List<Team> findAllTeam();


//    List<Team> findTeamByName(String teamName);
//
//   Team findOneTeamById(int teamId);


    int count();

    List<Team> findTeamByKeyword(String type,String keyWord);
}
