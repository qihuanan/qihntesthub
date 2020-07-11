package com.qihn.utils;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.apache.commons.lang3.StringUtils;

import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

public class CacheUtil {

    private static Cache<String,Object> cache;
    static {
        // 通过CacheBuilder构建一个缓存实例
        cache = CacheBuilder.newBuilder()
                .maximumSize(10000) // 设置缓存的最大容量
                .expireAfterWrite(100, TimeUnit.MINUTES) // 设置缓存在写入一分钟后失效
                //.concurrencyLevel(10) // 设置并发级别为10
                .recordStats() // 开启缓存统计
                .build();


    }

    public static void remove(String key){
        if(StringUtils.isNotEmpty(key)){
            cache.invalidate(key);
        }
    }
    public static Object get(String key){
       return  cache.getIfPresent("key");
    }

    public static void put(String key,String value){
        if(StringUtils.isNotEmpty(key) && value !=null){
            cache.put(key,value);
        }
    }

    public static void getload(String key, Callable c) throws Exception{
        // 获取缓存，当缓存不存在时，则通Callable进行加载并返回。该操作是原子
        Object getValue = cache.get("k1", new Callable<Object>() {
            @Override
            public Object call() throws Exception {
                return null;
            }
        });
    }

}
