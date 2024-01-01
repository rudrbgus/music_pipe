package com.meatjellyburgur.musicpipe.config;


import com.meatjellyburgur.musicpipe.interceptor.AfterLoginInterceptor;
import com.meatjellyburgur.musicpipe.interceptor.AutoLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {
    private final AfterLoginInterceptor afterLoginInterceptor;
    private final AutoLoginInterceptor autoLoginInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/user/sign-in", "/user/sign-up");

        // 자동 로그인 인터셉터 설정
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");
    }
}
