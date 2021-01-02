package com.blog.service.impl;

import com.blog.dao.MessageDao;
import com.blog.entity.Message;
import com.blog.entity.Reply;
import com.blog.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDao messageDao;
    @Override
    public List<Message> findAllMessage() {
        return messageDao.findAllMessage();
    }

    @Override
    public List<Message> getIndexMessage() {
        List<Message> messages=messageDao.getIndexMessage();
        for (Message message : messages) {
            if (message.getContent().length()>10)
            message.setContent(message.getContent().substring(0,10)+"..");
        }
        return messages;
    }

    @Override
    public void saveMessage(Message message) {

        Date date=new Date();
        message.setCreate_time(date);
        messageDao.saveMessage(message);
    }

    @Override
    public void saveReplyMessage(Reply reply) {
        Date date=new Date();
        reply.setCreate_time(date);
        messageDao.saveReplyMessage(reply);
    }
}
