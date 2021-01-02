package com.blog.service;

import com.blog.entity.Notice;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NoticeService {
    public List<Notice> findAllNotice();
    public void addNotices(Notice notice);
    public void deleteNotice(int id);
}
