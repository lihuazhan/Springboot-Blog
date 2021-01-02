package com.blog.dao;


import com.blog.entity.Message;
import com.blog.entity.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MessageDao {
    List<Message> findAllMessage();
    List<Message> getIndexMessage();
    void saveMessage(Message message);

    void saveReplyMessage(Reply reply);
}
