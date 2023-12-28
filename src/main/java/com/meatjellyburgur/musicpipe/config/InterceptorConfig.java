package com.meatjellyburgur.musicpipe.config;


import com.meatjellyburgur.musicpipe.interceptor.AfterLoginInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {
    private final AfterLoginInterceptor afterLoginInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/user/sign-in", "/user/sign-up");
    }
}
