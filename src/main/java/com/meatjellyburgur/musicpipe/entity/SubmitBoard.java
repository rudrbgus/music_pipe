package com.meatjellyburgur.musicpipe.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@EqualsAndHashCode @ToString @Getter
public class SubmitBoard {
    private int boardId;
    private int userId;
    private String text;
}
