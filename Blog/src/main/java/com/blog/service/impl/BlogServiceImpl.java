package com.blog.service.impl;

import com.blog.dao.BlogDao;
import com.blog.entity.*;
import com.blog.exception.NotFoundException;
import com.blog.service.BlogService;
import com.blog.service.TagService;
import com.blog.utils.MarkdownUtils;
import com.blog.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    BlogDao blogDao;
    @Autowired
    TagService tagService;
    @Autowired
    RedisUtil redisUtil;

    private Boolean hasKey = false;

    @Override
    public void updateView(Long id) {
        blogDao.updateView(id++);
    }

    @Override
    public Blog getBlog(Long id) {

        return blogDao.getBlog(id);
    }

    @Override
    public Blog getDetailedBlog(Long id) {
        Blog blog = blogDao.getDetailedBlog(id);
        if (blog == null) {
            throw new NotFoundException("该博客不存在");
        }
        String content = blog.getContent();
        blog.setContent(MarkdownUtils.markdownToHtmlExtensions(content));  //将Markdown格式转换成html
        return blog;
    }

    @Override
    public List<Blog> getAllBlog() {
        return blogDao.getAllBlog();
    }

    @Override
    public List<Blog> getByTypeId(Long typeId) {
        return blogDao.getByTypeId(typeId);
    }

    @Override
    public List<Blog> getByTagId(Long tagId) {
        return blogDao.getByTagId(tagId);
    }

    @Override
    public List<Blog> getIndexBlog() {
        List<Blog> blogs = blogDao.getIndexBlog();
//        int startPage=(pageNum-1)*5;
//        List<Blog> blogs= blogDao.getBlogTadIds();
//        System.out.println(blogs.size());
//        List<Tag> tags;
//        for (Blog blog : blogs) {
//            tags=new ArrayList<>();
//            for (TagIds id : blog.getTagsId()) {
//                tags.add(tagService.getTagById(id.getTag_id()));
//            }
//            blog.setTags(tags);
//
//        }

        return blogs;
    }

    @Override
    public List<Blog> getAllRecommendBlog() {
        return blogDao.getAllRecommendBlog();
    }

    @Override
    public List<Blog> getSearchBlog(String query) {
        return blogDao.getSearchBlog(query);
    }

    @Override
    public Map<String, List<Blog>> archiveBlog() {
        List<String> years;
        Map<String, List<Blog>> map = new LinkedHashMap<>();
        years = blogDao.findGroupYear();
        Set<String> set = new HashSet<>(years);  //set去掉重复的年份

//        转回list进行排序
        years = new ArrayList<>(set);
        Collections.sort(years);
        Collections.reverse(years);
//    遍历
        for (String year : years) {
            System.out.println(year);
            map.put(year, findBlogAndTagsByYear(year));
        }
        return map;
    }

    /*
    根据查找文章的所有
     */
    public List<Blog> findBlogAndTagsByYear(String year) {
        List<Blog> blogAndTagIds = blogDao.findBlogAndTagsByYear(year);

//       将标签的id集合遍历查找出标签
        List<Tag> tags;
        for (Blog blogAndTagId : blogAndTagIds) {
            tags = new ArrayList<>();
            for (TagIds tagIds : blogAndTagId.getTagsId()) {
                tags.add(tagService.getTagById(tagIds.getTag_id()));

            }
//            System.out.println(tags.size());
            blogAndTagId.setTags(tags);
        }

        return blogAndTagIds;
    }

    @Override
    public int countBlog() {
        return blogDao.getAllBlog().size();
    }

    @Override
    public List<Blog> searchAllBlog(Blog blog) {
        return blogDao.searchAllBlog(blog);
    }


    /**
     * 排行榜信息
     *
     * @return
     */
    @Override
    public List<RankBlog> findBlogByLank() {

//        if (redisUtil.get("rank")==null)
//        {
//            System.out.println("走MYSQL---");
            List<RankBlog> rankBlogs = new ArrayList<>();

            rankBlogs = blogDao.findBlogByRank();
//            for (RankBlog lankBlog : rankBlogs) {
//                if (lankBlog.getTitle().length() > 25) {
//                    lankBlog.setTitle(lankBlog.getTitle().substring(0, 24) + "..");
//                }
//            }
//            redisUtil.set("rank",rankBlogs,60*60*24);
            return rankBlogs;

//
//        }else {
//            System.out.println("走REDIS---");
//            return (List<RankBlog>) redisUtil.get("rank");
//
//        }

    }

    @Override
    public Long getLike(Long id) {
        return blogDao.getLike(id);
    }

    @Override
    public void addLike(Long blogId, Long userId) {
        blogDao.addLike(blogId);
        blogDao.addBlog_Like(blogId, userId);
        System.out.println("执行插入Like_User");

    }

    @Override
    public int getLikeByUser(Long userId, Long blogId) {
        return blogDao.getLikeByUser(userId, blogId);
    }


    @Override
    public void cancelLike(Long blogId, Long userId) {
        blogDao.cancelLike(blogId);
        blogDao.removeBlog_Like(blogId, userId);
    }


    @Override    //新增博客
    public int saveBlog(Blog blog) {
        blog.setCreateTime(new Date());
        blog.setUpdateTime(new Date());
        blog.setViews(0);
        //保存博客
        blogDao.saveBlog(blog);
        //保存博客后才能获取自增的id
        Long id = blog.getId();
        //将标签的数据存到t_blogs_tag表中
        List<Tag> tags = blog.getTags();
        BlogAndTag blogAndTag = null;
        for (Tag tag : tags) {
            //新增时无法获取自增的id,在mybatis里修改
            blogAndTag = new BlogAndTag(tag.getId(), id);
            blogDao.saveBlogAndTag(blogAndTag);
        }
        return 1;
    }

    @Override   //编辑博客
    public int updateBlog(Blog blog) {
        blog.setUpdateTime(new Date());
        //将标签的数据存到t_blogs_tag表中
        List<Tag> tags = blog.getTags();
        BlogAndTag blogAndTag = null;
        for (Tag tag : tags) {
            blogAndTag = new BlogAndTag(tag.getId(), blog.getId());
            blogDao.saveBlogAndTag(blogAndTag);
        }
        return blogDao.updateBlog(blog);
    }

    @Override
    public int deleteBlog(Long id) {
        return blogDao.deleteBlog(id);
    }


}
