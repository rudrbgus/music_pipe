package com.meatjellyburgur.musicpipe.interceptor;

import com.meatjellyburgur.musicpipe.entity.User;
import com.meatjellyburgur.musicpipe.repository.UserMapper;
import com.meatjellyburgur.musicpipe.service.UserService;
import com.meatjellyburgur.musicpipe.util.SignInUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@Configuration
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {
    private final UserMapper userMapper;
    private final UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 유저한테 자동로그인 쿠키가 있는지 확인
        Cookie cookie = WebUtils.getCookie(request, SignInUtils.AUTO_LOGIN_COOKIE);
        if(cookie != null){
            String sessionId = cookie.getValue();

            User user = userMapper.findUserByCookie(sessionId);

            if(user!= null && LocalDateTime.now().isBefore(user.getLimitTime())){
                userService.maintainLoginState(request.getSession(), user.getEmail());
            }
        }

        return true;
    }
}
