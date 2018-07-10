package com.qihn.utils;


public final class FutureMaps {
    private FutureMaps(){
    }

    public static <K, V> FutureMap<K, V> newFutureMap() {
        return new FutureMap<>();
    }
}
