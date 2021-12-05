package com.example.dao;

import com.example.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author YuanQian
 */
public interface BookMapper {

    /**
     * 增加一本书
     *
     * @param book book对象
     * @return 返回值为影响行数
     */
    int addBook(Books book);

    /**
     * 根据id删除一本书
     *
     * @param id 参数为int类型
     * @return 返回值为影响行数
     */
    int deleteBookById(@Param("bookID") int id);

    /**
     * 根据id增加一本书
     *
     * @param book book对象
     * @return 返回值为影响行数
     */
    int updateBook(Books book);

    /**
     * 根据id查询一本图书
     *
     * @param id 参数为int类型
     * @return 返回值为一个book对象
     */
    Books queryBookById(@Param("bookID") int id);

    /**
     * 查询所有图书信息
     *
     * @param number 参数为当前页码
     * @return 返回值为一个book集合
     */
    List<Books> queryBook(@Param("number") int number);

    /**
     * 根据名字查询图书信息
     *
     * @param bookName 参数为图书名字
     * @param number   当前页数
     * @return 返回值为只有一个图书对象的List集合
     */
    List<Books> queryBookByName(@Param("bookName") String bookName, @Param("number") int number);

    /**
     * 查询图书总数
     *
     * @return 返回图书总数
     */
    int queryBookTotal();

    /**
     * 根据图书名称查询图书总数
     *
     * @param name 图书名称
     * @return 图书总数
     */
    int queryBookTotal(String name);
}
