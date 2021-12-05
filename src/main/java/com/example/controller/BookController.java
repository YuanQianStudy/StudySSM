package com.example.controller;

import com.example.pojo.Books;
import com.example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author YuanQian
 */
@Controller
@RequestMapping("/Book")
public class BookController {


    private BookService bookService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    /**
     * 显示图书列表的功能，在请求地址为/Book且请求方式为GET时，执行此方法
     * 此方法会根据传入参数查询图书，并返回
     */
    @RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "number", defaultValue = "0") int number, @RequestParam(value = "bookName", required = false) String bookName, Model model) {
        //获取总页数
        int pageTotal;
        if (bookName == null) {
            pageTotal = (bookService.queryBookTotal() - 1) / 5;
        } else {
            pageTotal = (bookService.queryBookTotal(bookName) - 1) / 5;
        }
        //判断前端传来的页数是否符合规则
        if (number < 0) {
            number = 0;
        }
        if (number > pageTotal) {
            number = pageTotal;
        }
        //查询图书信息
        List<Books> books;
        //如果未传入图书名称，则只根据当前页码查询图书信息
        if (bookName == null) {
            books = bookService.queryBook(number);
        } else {
            books = bookService.queryBookByName(bookName, number);
            model.addAttribute("queryBook", "&bookName=" + bookName);
        }
        //根据book集合大小判断是否查询到图书
        if (books.size() == 0) {
            model.addAttribute("error", "未查询到书籍");
        }
        //将查询到的图书列表，当前页码，总页码回传到前端页面
        model.addAttribute("list", books);
        model.addAttribute("number", number);
        model.addAttribute("pageTotal", pageTotal);
        return "allBook";
    }

    /**
     * 跳转到添加或修改图书界面
     * 若未传入图书ID则启用添加图书功能
     * 若传入图书ID则启用修改图书功能
     */
    @RequestMapping(value = {"/addBookPage/{bookID}", "/addBookPage"})
    public String toAddBook(@PathVariable(value = "bookID", required = false) String bookID, Model model) {
        /*判断是否传入图书ID*/
        if (bookID == null) {
            //未传入图书ID执行添加图书功能
            model.addAttribute("title", "新增书籍");
            return "addBookPage";
        } else {
            //传入图书ID执行修改图书功能
            //根据ID获取要修改的图书的信息
            Books book = bookService.queryBookById(Integer.parseInt(bookID));
            model.addAttribute("book", book);
            model.addAttribute("title", "修改书籍");
        }
        return "addBookPage";
    }

    /**
     * 添加图书
     *
     * @param books 要添加的图书信息
     */
    @RequestMapping(method = RequestMethod.POST)
    public String addBook(Books books) {
        bookService.addBook(books);
        return "redirect:/Book";
    }

    /**
     * 修改图书
     *
     * @param books 要修改的图书信息
     */
    @RequestMapping(method = RequestMethod.PUT)
    public String updateBook(Books books) {
        bookService.updateBook(books);
        return "redirect:/Book";
    }

    /**
     * 根据传入的id删除图书
     *
     * @param bookID 图书id
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteBook(@PathVariable("id") String bookID) {
        bookService.deleteBookById(Integer.parseInt(bookID));
        return "redirect:/Book";
    }

}
