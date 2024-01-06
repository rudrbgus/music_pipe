package com.meatjellyburgur.musicpipe.service;

public enum Equipment {
    vocal(1),piano(2),keyboard(3)
    ,acoustic(4),eletric(5),base(6),
    drum(7),etc(8);

    public final int equipmentId;


    private Equipment(int equipmentId) {
        this.equipmentId=equipmentId;
    }
}
