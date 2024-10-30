//数据访问层，与数据库有关
//接口的方法
package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.entity.Admins;

public interface AdminsDao {
    int deleteById(Integer id);

    int insert(Admins record);

    int insertSelective(Admins record);

    Admins selectById(Integer id);

    int updateByIdSelective(Admins record);

    int updateById(Admins record);


    // 以上为mybatis generator自动生成接口, 具体实现在mapper.xml中

    // ------------------------------------------------------------

    // 以下方法使用mybatis注解实现
    //在核心配置文件中要把映射文件给加上，之前使用的时候，找寻的是resouce xml的资源路径，现在由于使用了注解，就只有接口文件了，所有配置相应的要做一个简单的修改


    /**
     * 通过用户名查找
     *
     * @param username
     * @return
     */
    @Select("select * from admins where username=#{username}")
    public Admins getByUsername(String username);

    /**
     * 通过用户名和密码查找
     *
     * @param username
     * @param password
     * @return 无记录返回null
     */
    @Select("select * from admins where username=#{username} and password=#{password}")
    public Admins getByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 获取列表
     *
     * @param page
     * @param rows
     * @return 无记录返回空集合
     */
    @Select("select * from admins order by id desc limit #{begin}, #{size}")
    public List<Admins> getList(@Param("begin") int begin, @Param("size") int size);

    /**
     * 总数
     *
     * @return
     */
    @Select("select count(*) from admins")
    public long getTotal();
}