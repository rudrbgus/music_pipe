package com.meatjellyburgur.musicpipe.util;

import javax.servlet.http.HttpSession;

public class SignInUtils {
    // 로그인 세션 키
    public static final String LOGIN_KEY = "login";

    // 자동 로그인 쿠키 이름
    public static final String AUTO_LOGIN_COOKIE = "auto";

    public static boolean isLogin(HttpSession session){
        return session.getAttribute(LOGIN_KEY) != null;
    }
}
