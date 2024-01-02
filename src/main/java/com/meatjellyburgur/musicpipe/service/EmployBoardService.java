package com.meatjellyburgur.musicpipe.service;


import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.dto.request.BoardWriteRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.BoardDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.BoardListResponseDTO;
import com.meatjellyburgur.musicpipe.entity.EmployBoard;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.EmployBoardMapper;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployBoardService {

    private final EmployBoardMapper employBoardMapper;
    private final UserMapper userMapper;

    //목록조회 중간ㅓ리

    public List<BoardListResponseDTO> getList(Search page){
        return employBoardMapper.findAll(page)
                .stream()
                .map(BoardListResponseDTO::new)
                .collect(Collectors.toList());
    }


    //글쓰기 중간처리
    public void register(BoardWriteRequestDTO dto) {
        //dto를 엔터티로 변환
        log.info("{}",dto);
        EmployBoard board = new EmployBoard(dto);
        employBoardMapper.save(board);

    }
//
//    public void delete(int bno) {
//        boardRepositoty.deleteByNo(bno);
//    }
//
//    public BoardDetailResponseDTO getDetail(int bno) {
//        Board board = boardRepositoty.findOne(bno);
//        //조회수 상승처리-> 이름을 좀더 명확하게 만들기
//        boardRepositoty.updateViewCount(bno);
//
//        return new BoardDetailResponseDTO(board);
//
//    }

    public int getCount(Search search){
        return  employBoardMapper.count(search);
    }

    public void delete(int boardId) {
        employBoardMapper.deleteByNo(boardId);
    }

    public BoardDetailResponseDTO getDetail(int bno) {
        log.info("{}",bno);
        EmployBoard board=employBoardMapper.findOne(bno);
        log.info("{}",board);
        //bno 이용해서 닉네임도 찾아야함 -> UserMapper 이용.
        User user = userMapper.findUserByUserId(board.getUserId());
        employBoardMapper.updateViewCount(bno);
        return new BoardDetailResponseDTO(board,user);

    }


}
