package com.xdli.study.redis.redistrial;

import java.util.Iterator;
import java.util.List;
import java.util.Set;


import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

/**
 * 使用本地redis库，简单测试java链接redis的使用方式，包括列表、字符串、集合等类型
 * @author Renqiang_cheng
 *
 **/
public class MyRedis {

    static private String redis_hostname = "pck8s-master";
    static private int redis_port = 30379;


    public static void main(String[] args) {
        connection();
        redisString();
        redisList();
        redisSet();

    }

    public static void redisSet(){
        Jedis jedis = new Jedis(MyRedis.redis_hostname, MyRedis.redis_port);
        Set<String> list = jedis.keys("*");
        Iterator<String> ite = list.iterator();
        while(ite.hasNext()){
            String key = ite.next();
            System.out.println("List of stored keys : " + key);
        }
    }

    public static void redisList(){
        Jedis jedis = new Jedis(MyRedis.redis_hostname, MyRedis.redis_port);
        jedis.lpush("tutorial-list", "Redis");
        jedis.lpush("tutorial-list", "Mongodb");
        jedis.lpush("tutorial-list", "Mysql");

        List<String> list = jedis.lrange("tutorial-list", 0, 5);
        for(int i = 0 ; i < list.size() ; i ++){
            System.out.println("Stroed string in redis : " + list.get(i));
        }
    }

    public static void redisString(){
        Jedis jedis = new Jedis(MyRedis.redis_hostname, MyRedis.redis_port);
        jedis.set("nameIs", "Li Xiaodong");
        System.out.println("Stored string in redis : " + jedis.get("nameIs"));
    }

    public static void connection(){
        Jedis jedis = new Jedis(MyRedis.redis_hostname, MyRedis.redis_port);
        System.out.println(jedis.ping());
        Transaction t = jedis.multi();
        t.exec();
    }
}


