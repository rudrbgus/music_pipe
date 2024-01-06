package com.meatjellyburgur.musicpipe.service;


import com.meatjellyburgur.musicpipe.common.Search;
import com.meatjellyburgur.musicpipe.dto.request.BoardWriteRequestDTO;
import com.meatjellyburgur.musicpipe.dto.response.BoardDetailResponseDTO;
import com.meatjellyburgur.musicpipe.dto.response.BoardListResponseDTO;
import com.meatjellyburgur.musicpipe.entity.EmployBoard;
import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.EmployBoardMapper;
import com.meatjellyburgur.musicpipe.repository.NeedEquipmentMapper;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployBoardService {

    private final EmployBoardMapper employBoardMapper;
    private final UserMapper userMapper;
    private final NeedEquipmentMapper needEquipmentMapper;

    //목록조회 중간ㅓ리

    public List<BoardListResponseDTO> getList(Search page){
        //모든 리스트 + 리스트별 모집 악기 불러와야함.
        List<BoardListResponseDTO> collect = new ArrayList<>();
        for (EmployBoard board : employBoardMapper.findAll(page)) {
            BoardListResponseDTO boardListResponseDTO = new BoardListResponseDTO(board);
            int boardId = boardListResponseDTO.getBoardId();

            //need_equipment 테이블에 해당 보드 아이디가 있으면 포장해서 보내기...!
            List<Integer> allEquipmentIdByBoardId = needEquipmentMapper.findAllEquipmentIdByBoardId(boardId);

            boardListResponseDTO.setRecruit_equipment(allEquipmentIdByBoardId);

            log.info("Listdto{}",boardListResponseDTO.getRecruit_equipment());

            collect.add(boardListResponseDTO);
        }

        log.info("BoardListResponseDTO{}",collect);
        return collect;
    }


    //글쓰기 중간처리
    public void register(BoardWriteRequestDTO dto) {
        //dto를 엔터티로 변환
        log.info("{}",dto);
        EmployBoard board = new EmployBoard(dto);
        int userId = dto.getUserId();

        //유저아이디 이용해서 need_equipmemnt에 값 넣기
        employBoardMapper.save(board);
        //

        //equipment enum 통해서 번호값을 받아와서
        Map<String, String> needEquipments = dto.returnEquipment();
        //모집악기 체크 여부 확인해서 need equipment에 넣는 메서드
        registerNeedEquipment(needEquipments, board.getBoardId());





    }
    //모집악기 체크 여부 확인해서 need equipment에 넣는 메서드

    public  void  registerNeedEquipment(Map<String,String> needEquipments, int boardId){
        needEquipments.forEach((key,value)->{
            if(value.equals("on")){
                //만약에 악기가 체크되어 있으면
                //need_equipment mapper 이용해서 저장함.
                needEquipmentMapper.save(boardId,Equipment.valueOf(key).equipmentId);

            }
                }

        );

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
