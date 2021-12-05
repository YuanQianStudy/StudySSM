package com.example.service;

import com.example.pojo.Books;

import java.util.List;

/**
 * @author YuanQian
 */
public interface BookService {
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
    int deleteBookById(int id);

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
    Books queryBookById(int id);

    /**
     * 查询所有图书信息
     *
     * @param number 参数为当前页码
     * @return 返回值为一个book集合
     */
    List<Books> queryBook(int number);

    /**
     * 根据图书名字查询图书信息
     *
     * @param bookName 参数为String类型的图书名字
     * @param number   参数为当前页数
     * @return 返回值为只有一个对象的List集合
     */
    List<Books> queryBookByName(String bookName, int number);

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
