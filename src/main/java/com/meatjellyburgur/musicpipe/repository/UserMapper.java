package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface UserMapper {
    //회원 가입
    boolean save(User user);


    User findUser(String email);

    User findUserByUserId(int userId);



    boolean isDuplicate(@Param("type") String type, @Param("keyword") String keyword);

    List<User> findUseByTeamId(int teamId);



}
