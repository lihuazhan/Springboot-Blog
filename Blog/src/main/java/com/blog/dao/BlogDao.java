package com.blog.dao;

import com.blog.entity.Blog;
import com.blog.entity.BlogAndTag;
import com.blog.entity.RankBlog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BlogDao {

    Blog getBlog(Long id);  //后台展示博客
    void updateView(Long id);
    Blog getDetailedBlog(@Param("id") Long id);  //博客详情

    List<Blog> getAllBlog();

    List<Blog> getByTypeId(Long typeId);  //根据类型id获取博客

    List<Blog> getByTagId(Long tagId);  //根据标签id获取博客

    List<Blog> getIndexBlog();  //主页博客展示

    List<Blog> getAllRecommendBlog();  //推荐博客展示

    List<Blog> getSearchBlog(String query);  //全局搜索博客

    List<Blog> searchAllBlog(Blog blog);  //后台根据标题、分类、推荐搜索博客

    List<String> findGroupYear();  //查询所有年份，返回一个集合

    List<Blog> getBlogTadIds();
    List<Blog> findBlogAndTagsByYear(@Param("year") String year);
    int saveBlog(Blog blog);

    int saveBlogAndTag(BlogAndTag blogAndTag);

    int updateBlog(Blog blog);

    int deleteBlog(Long id);
    List<RankBlog> findBlogByRank();

//    点赞相关
    Long getLike(Long id);
    void addLike(Long blogId);
    int getLikeByUser(Long userId,Long blogId);
    void addBlog_Like(Long blogId,Long userId);
    void removeBlog_Like(Long blogId,Long userId);
    void cancelLike(Long blogId);


}
