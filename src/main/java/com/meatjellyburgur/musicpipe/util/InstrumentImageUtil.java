package com.meatjellyburgur.musicpipe.util;

public class InstrumentImageUtil {
    public static String instrumentImage(int instrumentNumber) {
        switch (instrumentNumber) {
            case 1:
                return "guitar2";
            case 2:
                return "drum";
            case 3:
                return "vocal";
            case 4:
                return "keyboard";
            case 5:
                return "saxophone";
            case 6:
                return "trumpet";
            case 7:
                return "flute";
            case 8:
                return "bass-guitar";
            default:
                return "default-instrument-image";
        }
    }
}