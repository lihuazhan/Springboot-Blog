package com.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
    private TagIds type;
    private Long id;
    private String title;
    private String content;
    private String firstPicture;
//    原创转载
    private String flag;
    private Integer views;
    private boolean shareStatement;
    private boolean commentabled;
//    已发布
    private boolean published;
    private Date createTime;
    private Date updateTime;

    private Long userId;


    private String description;
    private int like;

    private Admin admin;

    private List<Tag> tags = new ArrayList<>();

    private List<Comment> comments = new ArrayList<>();

    private List<TagIds> tagsId=new ArrayList<>();


    private String tagIds;
    public void init(){
        this.tagIds = tagsToIds(this.getTags());
    }

    //将tags集合转换为tagIds字符串形式：“1,2,3”,用于编辑博客时显示博客的tag
    private String tagsToIds(List<Tag> tags){
        if(!tags.isEmpty()){
            StringBuffer ids = new StringBuffer();
            boolean flag = false;
            for(Tag tag: tags){
                if(flag){
                    ids.append(",");
                }else {
                    flag = true;
                }
                ids.append(tag.getId());
            }
            return ids.toString();
        }else {
            return tagIds;
        }
    }

}
