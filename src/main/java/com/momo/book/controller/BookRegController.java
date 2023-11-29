package com.momo.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.book.dao.BookDao;
import com.momo.lib.dto.BookDto;

@WebServlet("/book/bookRegProcess")
public class BookRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Get방식 요청입니다. 확인 후 다시 요청하세요.").append(request.getContextPath());
	}

	/**
	 * 도서 등록 후 메세지 처리
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메터를 수집 후 BookDto를 생성한다.
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("imgFile"));
		BookDto dto = new BookDto("", title, author, "");
		
		// 도서 등록 처리
		BookDao dao = new BookDao();
		int res = dao.regBook(dto);
		
		System.out.println("res : " + res);
		// 입력 성공
		if (res > 0) {
			request.setAttribute("msg", "등록되었습니다.");
			request.setAttribute("url", "/book/list");
		
		// 입력 실패
		} else {
			request.setAttribute("msg", "등록중 오류 발생.\n관리자에게 문의하세요");
		}
		
		// 페이지 전환 (도서등록 성공 : 목록 페이지로 이동, 실패 : 뒤로가기)
		request.getRequestDispatcher("/book/msgBox.jsp").forward(request, response);
		
		
	}

}














