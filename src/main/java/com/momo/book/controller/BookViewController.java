package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.lib.dto.BookDto;

/**
 * Servlet implementation class BookViewController
 */
@WebServlet("/book/view")
public class BookViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * 도서정보를 조회 후 request 영역에 저장하고 view.jsp로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서 정보를 조회 후 request 영역에 저장
		BookDao dao = new BookDao();
		BookDto dto = dao.view(request.getParameter("no"));
		
		//자원 반납
		dao.close();
		
		// book/view.jsp 페이지로 전환
		request.setAttribute("bookDto", dto);
		request.getRequestDispatcher("/book/view.jsp").forward(request, response);
	}

}
