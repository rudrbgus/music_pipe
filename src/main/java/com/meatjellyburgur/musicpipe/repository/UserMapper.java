package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.dto.request.AutoLoginDTO;
import com.meatjellyburgur.musicpipe.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface UserMapper {
    //회원 가입
    boolean save(User user);


    void saveAutoLogin(AutoLoginDTO dto);

    User findUser(String email);

    User findUserByUserId(int userId);

    User findUserByCookie(String sessionId);



    boolean isDuplicate(@Param("type") String type, @Param("keyword") String keyword);

    List<User> findUseByTeamId(int teamId);



}
