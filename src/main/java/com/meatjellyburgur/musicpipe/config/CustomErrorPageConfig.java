package com.meatjellyburgur.musicpipe.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.http.HttpStatus;

public class CustomErrorPageConfig implements ErrorPageRegistrar {
    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        ErrorPage errorPage404 = new ErrorPage(HttpStatus.NOT_FOUND, "/error/404");
        ErrorPage errorPage500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/505");

        registry.addErrorPages(errorPage404, errorPage500);
    }
}
