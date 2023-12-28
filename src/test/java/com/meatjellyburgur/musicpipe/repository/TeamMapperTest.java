package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.Team;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.event.RecordApplicationEvents;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest

class TeamMapperTest {
    @Autowired
    TeamMapper mapper;

    @Test
    @DisplayName("팀 전체 목록을 조회한다")
    void findAllTeamTest(){
        List<Team> allTeam = mapper.findAllTeam();
        System.out.println("allTeam = " + allTeam);
    }

    @Test
    @DisplayName("아이디 1 인팀을 조회하면 팀 이름이 가가팀이여야한다")
    void findTeamByIdTest(){
        int id=1;
        Team team = mapper.findOneTeamById(id);
        assertEquals("가가팀",team.getTeamName());
    }

    @Test
    @DisplayName("검색어가 '가가' 이면 이 검색어가 들어간 팀이 2개 나와야한다")
    void findTeamByIdName(){
        String keyWord="가가";
        List<Team> teamByName = mapper.findTeamByName(keyWord);
        assertEquals(2,teamByName.size());
    }

}