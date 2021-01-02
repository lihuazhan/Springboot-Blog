package com.blog.service;

import com.blog.entity.Message;
import com.blog.entity.Reply;

import java.util.List;

public interface MessageService {
    List<Message> findAllMessage();
    List<Message> getIndexMessage();
    void saveMessage(Message message);
    void saveReplyMessage(Reply reply);
}
