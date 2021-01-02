package com.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private int id;
    private String content;
    private String nickName;
    private String msg_avatar;
    private Date create_time;
    private int admin;

    List<Reply> replies;



}
