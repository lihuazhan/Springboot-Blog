package com.blog.service.impl;

import com.blog.dao.NoticeDao;
import com.blog.entity.Notice;
import com.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;
    @Override
    public List<Notice> findAllNotice() {
        return noticeDao.findAllNotice();
    }

    @Override
    public void addNotices(Notice notice) {
        noticeDao.addNotices(notice);
    }

    @Override
    public void deleteNotice(int id) {
        noticeDao.deleteNotice(id);
    }
}
