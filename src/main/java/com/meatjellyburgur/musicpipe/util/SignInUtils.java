package com.meatjellyburgur.musicpipe.util;

import com.meatjellyburgur.musicpipe.dto.response.SignInUserResponseDTO;

import javax.servlet.http.HttpSession;

public class SignInUtils {
    // 로그인 세션 키
    public static final String LOGIN_KEY = "login";

    // 자동 로그인 쿠키 이름
    public static final String AUTO_LOGIN_COOKIE = "auto";

    public static boolean isLogin(HttpSession session){
        return session.getAttribute(LOGIN_KEY) != null;
    }

    // 로그인한 사람의 유저 아이디를 반환하는 메서드
    public static int getCurrentLoginUserId(HttpSession session) {
        SignInUserResponseDTO loginUserInfo
                = (SignInUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return loginUserInfo.getUserId();
    }
}
