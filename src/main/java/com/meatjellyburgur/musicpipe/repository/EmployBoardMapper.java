package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.entity.EmployBoard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmployBoardMapper {

    List<EmployBoard> findAll(Search page);

    //상세조회
    EmployBoard findOne(int boardId);

    //게시물 등록
    boolean save(EmployBoard board);

    //게시물 사삭데
    boolean deleteByNo(int boardNo);

    //조회수 상승 기능 처리
    //추가로
    void updateViewCount(int boardId);

    //총게시물수 구하기
    int count(Search search);



}
