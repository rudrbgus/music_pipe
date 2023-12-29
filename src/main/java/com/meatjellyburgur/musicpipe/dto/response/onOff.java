package com.meatjellyburgur.musicpipe.dto.response;

public enum onOff {
    ONLINE("온라인"),
    OFFlLINE("오프라인");

    public final String label;

    private onOff(String label) {
        this.label = label;
    }
}
