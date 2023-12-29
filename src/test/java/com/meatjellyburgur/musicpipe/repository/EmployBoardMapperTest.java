package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.entity.EmployBoard;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class EmployBoardMapperTest {
    @Autowired
    EmployBoardMapper mapper;
    @Test
    @DisplayName("포지션 1번을 넣으면 포지션 1을 원하는 employboard가 3개 나올 것이다")
    void findAlltest(){
        int positionNo=1;
        Search search = new Search();
        search.setType("position");
        List<EmployBoard> all = mapper.findAll(search);
        System.out.println("all = " + all);
    }

}