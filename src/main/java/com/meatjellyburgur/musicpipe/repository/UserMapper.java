package com.meatjellyburgur.musicpipe.repository;


import com.meatjellyburgur.musicpipe.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface UserMapper {
    //회원 가입
    boolean save(User user);

    //로그인 양식 요청
    User findUser(String email);
    //로그인 검증 요청

    /**
     // 중복체크(email, nickname)
     * @param type -중복을 검사할 내용 email ,nickname
     *
     * @param keyword- 중복검사 입력값 ex abc@gmail.com
     * @return- 중복이면 true 아니면 false
     */

    boolean isDuplicate(@Param("type") String type, @Param("keyword") String keyword);


}
