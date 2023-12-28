package com.meatjellyburgur.musicpipe.interceptor;

import com.meatjellyburgur.musicpipe.util.SignInUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Configuration
public class AfterLoginInterceptor  implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(SignInUtils.isLogin(session)){
            response.sendRedirect("/");
            return false;
        }
        return true;
    }
}
