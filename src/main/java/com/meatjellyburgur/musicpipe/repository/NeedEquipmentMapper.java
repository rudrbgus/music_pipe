package com.meatjellyburgur.musicpipe.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NeedEquipmentMapper {
    void save(int boardId, int equipmentId);

    List<Integer> findAllEquipmentIdByBoardId(int boardId);
}
