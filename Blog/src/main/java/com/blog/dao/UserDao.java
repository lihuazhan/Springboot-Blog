package com.blog.dao;

import com.blog.entity.Admin;
import com.blog.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDao {
//    @Select("select * from t_user where username=#{username} and password=#{password}")
    User queryByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    void addUser(User user);

    Admin queryByUsernameAndPassword2(@Param("username") String username, @Param("password") String password);
}
