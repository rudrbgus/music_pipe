package com.meatjellyburgur.musicpipe.repository;

import com.meatjellyburgur.musicpipe.entity.PersonalAbility;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonalAbilityMapper {
    boolean save(PersonalAbility p);

    List<PersonalAbility> findAll();

    List<PersonalAbility> findPersonalAbilityList(int userId);

    List<Integer> findUserIdByEquipmentId(int equipmentId);

    boolean isDuplicate(int userId, int equipmentId);

    boolean remove(PersonalAbility p);

}
