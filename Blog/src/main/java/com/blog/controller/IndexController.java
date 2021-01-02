package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.entity.RankBlog;
import com.blog.entity.Tag;
import com.blog.entity.User;
import com.blog.service.BlogService;
import com.blog.service.MessageService;
import com.blog.service.NoticeService;
import com.blog.service.TagService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private TagService tagService;
    @Autowired
    private MessageService messageService;



    private HttpSession session;



    @GetMapping("/")
    public String toIndex(@RequestParam(required = false,defaultValue = "1",value = "pageNum")int pagenum, Model model){

        PageHelper.startPage(pagenum,5);
//
        List<Blog> allBlog = blogService.getIndexBlog();
//
        List<Tag> allTag = tagService.getBlogTag();  //获取博客的标签(联表查询)

        //得到分页结果对象
        PageInfo pageInfo = new PageInfo(allBlog);


        List<RankBlog> lankBlogs=blogService.findBlogByLank();

        model.addAttribute("lankBlogs", lankBlogs);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("tags", allTag);
        model.addAttribute("notices",noticeService.findAllNotice());
        model.addAttribute("messages",messageService.getIndexMessage());


        return "index";
    }


    @PostMapping("/search")
    public String search(@RequestParam(required = false,defaultValue = "1",value = "pagenum")int pagenum,
                         @RequestParam String query, Model model){

        PageHelper.startPage(pagenum, 5);
        List<Blog> searchBlog = blogService.getSearchBlog(query);
        PageInfo pageInfo = new PageInfo(searchBlog);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("query", query);
        return "search";
    }

    @GetMapping("/blog/{id}")
    public String toLogin(@PathVariable Long id, Model model, HttpSession session){
        Blog blog = blogService.getDetailedBlog(id);
        blogService.updateView(id);
//        判断是否给该文章点赞
        if (session.getAttribute("user")!=null)
        {
            User user=(User)session.getAttribute("user");
            if (blogService.getLikeByUser(user.getId(),id)!=0){
                model.addAttribute("like", 1);
            }
        }

        model.addAttribute("blog", blog);
        return "blog";
    }

    @GetMapping("/blog/like")
    @ResponseBody
    public String like(@RequestParam(required = true) Long blogId, @RequestParam(required = true)int like, HttpSession session){


        User user=(User)session.getAttribute("user");
        blogService.addLike(blogId,user.getId());
        System.out.println( blogService.getLike(blogId));
        String str= String.valueOf(blogService.getLike(blogId));
        return  str;
    }
    @GetMapping("/blog/cancelLike")
    @ResponseBody
    public String cancelLike(@RequestParam(required = true) Long blogId, HttpSession session){


        User user=(User)session.getAttribute("user");
        blogService.cancelLike(blogId,user.getId());
        System.out.println( blogService.getLike(blogId));
        String str= String.valueOf(blogService.getLike(blogId));
        return  str;
    }






}
