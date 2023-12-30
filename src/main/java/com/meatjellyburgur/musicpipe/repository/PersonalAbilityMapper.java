package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonalAbilityMapper {
    boolean save(PersonalAbility p);

    List<PersonalAbility> findAll();

    PersonalAbility findOne(int userId);

    List<Integer> findUserIdByEquipmentId(int equipmentId);

}
