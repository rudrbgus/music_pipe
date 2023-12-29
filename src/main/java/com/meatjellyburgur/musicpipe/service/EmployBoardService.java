package com.meatjellyburgur.musicpipe.service;


import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.dto.response.BoardListResponseDTO;
import com.meatjellyburgur.musicpipe.repository.EmployBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EmployBoardService {

    private final EmployBoardMapper employBoardMapper;

    //목록조회 중간ㅓ리
    public List<BoardListResponseDTO> getList(Search page){
        return boardRepositoty.findAll(page)
                .stream()
                .map(BoardListResponseDTO::new)
                .collect(Collectors.toList());
    }
}
