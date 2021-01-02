package com.blog.controller.admin;

import com.blog.entity.Tag;
import com.blog.service.TagService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class TagController {

    @Autowired
    TagService tagService;

    @GetMapping("/tags")
    public String tags(@RequestParam(required = false,defaultValue = "1",value = "pagenum")int pagenum, Model model){
        PageHelper.startPage(pagenum, 5);
        List<Tag> allTag = tagService.getAllTag();
        //得到分页结果对象
        PageInfo<Tag> pageInfo = new PageInfo<>(allTag);
        model.addAttribute("pageInfo", pageInfo);

        return "admin/admin-tags";
    }

    /**
     * 点击新增按钮跳转到新增页面
     * @param model
     * @return
     */
    @GetMapping("/tags/input")
    public String toAddTag(Model model){
        model.addAttribute("tag", new Tag());   //返回一个tag对象给前端th:object
        return "admin/tags-input";
    }

    /**
     * 跳到修改页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/tags/{id}/input")
    public String toEditTag(@PathVariable Long id, Model model){
        model.addAttribute("tag", tagService.getTag(id));
        return "admin/tags-input";
    }


    /**
     * 执行新增
     * @param tag
     * @param attributes
     * @return
     */
    @PostMapping("/addTags")
    public String addTag(Tag tag, RedirectAttributes attributes){   //新增
        Tag t = tagService.getTagByName(tag.getName());
        if(t != null){
            attributes.addFlashAttribute("msg", "不能添加重复的标签");
            return "redirect:/admin/tags/input";
        }else {
            attributes.addFlashAttribute("msg", "添加成功");
        }
        tagService.saveTag(tag);
        return "redirect:/admin/tags";   //不能直接跳转到tags页面，否则不会显示tag数据(没经过tags方法)
    }

    /**
     * 执行删除
     * @param id
     * @param attributes
     * @return
     */
    @GetMapping("/tags/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes){
        tagService.deleteTag(id);
        attributes.addFlashAttribute("msg", "删除成功");
        return "redirect:/admin/tags";
    }

    /**
     * 执行修改
     * @param id
     * @param tag
     * @param attributes
     * @return
     */
    @PostMapping("/tags/{id}")
public String editTag(@PathVariable Long id, Tag tag, RedirectAttributes attributes){  //修改
    Tag t = tagService.getTagByName(tag.getName());
    if(t != null){
        attributes.addFlashAttribute("msg", "不能添加重复的标签");
        return "redirect:/admin/tags/input";
    }else {
        attributes.addFlashAttribute("msg", "修改成功");
    }
    tagService.updateTag(tag);
        return "redirect:/admin/tags";    //不能直接跳转到tags页面，否则不会显示tag数据(没经过tags方法)
}


}
