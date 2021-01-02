package com.blog.controller;

import com.blog.entity.Message;
import com.blog.entity.Reply;
import com.blog.entity.User;
import com.blog.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageService messageService;
    @GetMapping("/allMessage")
    public String find (Model model) {

        List<Message> messages=messageService.findAllMessage();

        model.addAttribute("messages",messages);
        return "message";
    }


    @PostMapping("/save")
    public String save(Message message, HttpSession session)
    {
       User user= (User) session.getAttribute("user");
        message.setMsg_avatar(user.getAvatar());
        message.setNickName(user.getUsername());
        messageService.saveMessage(message);
        return "redirect:/message/allMessage";
    }

    @PostMapping("/reply/save")
    public String saveReply(Reply reply, HttpSession session)
    {
        User user= (User) session.getAttribute("user");
        System.out.println(user.getAvatar());
        reply.setNickName(user.getUsername());
        reply.setAvatar(user.getAvatar());
        messageService.saveReplyMessage(reply);
        return "redirect:/message/allMessage";
    }
}
