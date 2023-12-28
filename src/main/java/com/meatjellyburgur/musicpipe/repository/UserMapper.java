package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.entity.User;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
    //회원 가입
    boolean save(User user);


}
