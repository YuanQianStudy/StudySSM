package com.example.service;

import com.example.dao.BookMapper;
import com.example.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author YuanQian
 */
public class BookServiceImpl implements BookService {

    /**
     * 组合DAO层
     */
    @Autowired
    private BookMapper bookMapper;

    @Override
    public int addBook(Books book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Books book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public Books queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Books> queryBook(int number) {
        return bookMapper.queryBook(number * 5);
    }

    @Override
    public List<Books> queryBookByName(String bookName, int number) {
        return bookMapper.queryBookByName(bookName, number * 5);
    }

    @Override
    public int queryBookTotal() {
        return bookMapper.queryBookTotal();
    }

    @Override
    public int queryBookTotal(String name) {
        return bookMapper.queryBookTotal(name);
    }
}
