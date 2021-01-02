package com.blog.controller.admin;

import com.blog.entity.Notice;
import com.blog.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notices")
    public String notices(@RequestParam(required = false,defaultValue = "1",value = "pagenum")int pagenum, Model model){
        PageHelper.startPage(pagenum, 8);
        List<Notice> allNotice = noticeService.findAllNotice();
        //得到分页结果对象
        PageInfo<Notice> pageInfo = new PageInfo<>(allNotice);
        model.addAttribute("pageInfo", pageInfo);

    return "admin/notice";
    }

    /**
     * 点击新增按钮跳转到新增页面
     * @param model
     * @return
     */
    @GetMapping("/notices/input")
    public String toNotices(Model model){
        return "admin/notices-input";
    }

    /**
     * 执行新增
     * @param notice
     * @return
     */
    @PostMapping("/notices")
    public String addTag(Notice notice){   //新增
        noticeService.addNotices(notice);

        return "redirect:/admin/notices";   //不能直接跳转到tags页面，否则不会显示tag数据(没经过tags方法)
    }

    /**
     * 执行删除
     * @return
     */
    @GetMapping("/notices/{id}/delete")
    public String delete(@PathVariable int id){
        noticeService.deleteNotice(id);
        return "redirect:/admin/notices";
    }

}
