package com.blog.controller;


import com.blog.entity.RankBlog;
import com.blog.service.BlogService;
import com.blog.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class RedisController {
    @Autowired
   private RedisUtil redisUtil;
    @Autowired
    private BlogService blogService;




    @GetMapping("/redis")
    @ResponseBody
    private String connection(){




//        redisUtil.lSet("blogs",rankBlogs,60*60*24);
//        List<Object> list=redisUtil.lGetRankBlog("blogs",0,-1);
//        List<RankBlog> blogList= (List<RankBlog>) list.get(0);


       // System.out.println( ":"+redisUtil.getExpire("rank"));
        return "success";
    }
}
