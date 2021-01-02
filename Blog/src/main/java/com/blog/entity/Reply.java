package com.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
    private int id;
    private int mes_id;
    private String avatar;
    private String reply_name;
    private String content;
    private String nickName;
    private Date create_time;
}
