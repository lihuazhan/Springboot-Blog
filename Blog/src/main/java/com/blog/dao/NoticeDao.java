package com.blog.dao;

import com.blog.entity.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface NoticeDao {
    public List<Notice> findAllNotice();
    public void addNotices(Notice notice);
    public void deleteNotice(int id);
}
